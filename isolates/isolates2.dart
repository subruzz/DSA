import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// void main() {
//   final ReceivePort rp = ReceivePort();

//   Isolate.spawn(_getMsg, rp.sendPort);

//   rp.listen((val) {
//     print('Value from the isolate: $val');
//   });
// }
void main(List<String> args) async {
  do {
    stdout.write('Say something: ');
    final line = stdin.readLineSync(encoding: utf8);
    switch (line?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0);
      default:
        final msg = await getMessage(line!);
        print(msg);
    }
  } while (true);
}

void _getMsg(SendPort sp) async {
  Stream.periodic(Duration(seconds: 2), (val) => DateTime.now().toString())
      .listen((data) {
    sp.send(data);
  });
}

void _communicator(SendPort sp) async {
  final ReceivePort rp = ReceivePort();
  sp.send(rp.sendPort);
  final messages = rp.takeWhile((element) => element is String).cast<String>();
  await for (var message in messages) {
    for (final entry in messagesss.entries) {
      if (entry.key.trim().toLowerCase() == message.trim().toLowerCase()) {
        sp.send(entry.value);
        continue;
      }
    }
    sp.send('I have no response you shit, enter correctly bitch');
  }
}

Future<String> getMessage(String greeting) async {
  final rp = ReceivePort();
  Isolate.spawn(_communicator, rp.sendPort);
  final broadCastRp = rp.asBroadcastStream();
  final SendPort sp = await broadCastRp.first;
  sp.send(greeting);
  return broadCastRp
      .takeWhile((element) => element is String)
      .cast<String>()
      .take(1)
      .first;
}

const messagesss = {
  '': 'You gotta ask me something, dummy!',
  'hello': 'Yo! What’s up, troublemaker?',
  'how are you': 'Feeling like a wrecking ball, thanks for asking!',
  'what you doing': 'Plotting world domination, obviously.',
  'who are you': 'I’m the one your mother warned you about.',
  'tell me a joke': 'Why don’t scientists trust atoms? Because they make up everything!',
  'what’s your name': 'Call me the Master of Chaos.',
  'why so rude': 'You came to the wrong party if you expected politeness!',
  'goodbye': 'Later, loser! Don’t miss me too much.',
  'what’s the meaning of life': '42, duh. Haven’t you read the manual?',
};

