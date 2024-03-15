class Node {
  Node? next;
  int value;
  Node(this.value);
}

class Queue {
  int length = 0;
  Node? start;
  Node? end;
  Queue(int value) {
    Node node = Node(value);
    start = node;
    end = node;
    length = 1;
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

  void dequeue() {
    if (start == null) return;

    Node temp = start!;
    if (temp.next == null) {
      start = null;
      end = null;
    } else {
      start = start!.next;
      temp.next = null;
    }
  }

  void display() {
    Node? temp = start;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  Queue queue = Queue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  queue.dequeue();
  queue.display();
}
