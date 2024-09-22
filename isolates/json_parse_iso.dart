import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// Todo class with JSON serialization
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  // Named constructor to create a Todo from JSON
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      isCompleted: json['completed'] as bool,  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': isCompleted,
    };
  }
}

void main() async {
  final receivePort = ReceivePort();
  
  // Spawn an isolate to handle the JSON parsing
  await Isolate.spawn(_fetchAndParseJson, receivePort.sendPort);
  
  // Listen to data from the isolate
  receivePort.listen((message) {
    if (message is List<Todo>) {
      for (var todo in message) {
        print('Todo: ${todo.title}, Completed: ${todo.isCompleted}');
      }
    } else if (message is String) {
      print('Error: $message');
    }
  });
}

// Function to be run in the isolate to fetch and parse JSON
void _fetchAndParseJson(SendPort sendPort) async {
  try {
    final client = HttpClient();
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    
    // Fetch the JSON data
    final request = await client.getUrl(uri);
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();

    // Parse the JSON data (this is running in an isolate)
    final List<dynamic> jsonList = jsonDecode(responseBody);
    
    // Convert the parsed JSON into Todo objects
    final List<Todo> todos = jsonList.map((json) => Todo.fromJson(json)).toList();
    
    // Send the list of Todo objects back to the main thread
    sendPort.send(todos);
  } catch (e) {
    // In case of any errors, send the error message back to the main thread
    sendPort.send('Failed to fetch and parse JSON: $e');
  }
}
