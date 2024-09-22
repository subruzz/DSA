class Node {
  int value;
  Node? next;
  Node(this.value);
}

class LinkedList {
  Node? head = null;
  Node? tail = null;

  void addNode(int value) {
    Node node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
      return;
    }
    tail?.next = node;
    tail = node;
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  LinkedList ll = LinkedList()
    ..addNode(2)
    ..addNode(3)
    ..addNode(2)
    ..display();
}
