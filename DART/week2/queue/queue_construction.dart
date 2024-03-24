class Node {
  Node? next;
  int value;
  Node(this.value);
}

class Queue {
  int length = 0;
  Node? start;
  Node? end;
  Queue() {
    // Node node = Node(value);
    // start = node;
    // end = node;
    // length = 1;
  }
  void enqueue(int value) {
    Node node = Node(value);
    if (start == null) {
      start = node;
      end = node;
    } else {
      end!.next = node;
      end = node;
    }
  }

  int dequeue() {
    if (start == null) {
      throw StateError('Queue is empty');
    }

    Node temp = start!;
    int dequeuedValue = temp.value; // Store the value to return

    if (temp.next == null) {
      start = null;
      end = null;
    } else {
      start = start!.next;
      temp.next = null;
    }

    return dequeuedValue; // Return the dequeued value
  }

  void display() {
    Node? temp = start;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  bool get isEmpty => start == null;
}

class Stack {
  Queue queue1 = Queue();
  Queue queue2 = Queue();

  void push(int value) {
    while (!queue1.isEmpty) {
      queue2.enqueue(queue1.dequeue());
    }
    queue1.enqueue(value);
    while (!queue2.isEmpty) {
      queue1.enqueue(queue2.dequeue());
    }
  }

  void pop() {
    queue1.dequeue();
  }

  void display() {
    queue1.display();
  }
}

void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.pop();
  stack.display();
  // Queue queue = Queue();
  // queue.enqueue(2);
  // queue.enqueue(3);
  // queue.enqueue(4);
  // queue.display();
}
