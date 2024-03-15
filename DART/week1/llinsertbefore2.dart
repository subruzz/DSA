class Node {
  Node(this.data);
  int? data;
  Node? next;
}

class SLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node? newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void insertBefore2Elements(int prevTo, int data) {
    Node? newNode = Node(data);
    Node? temp = head;

    if (temp?.data == prevTo || temp?.next?.data == prevTo) {
      print("Insertion not possible.");
      return;
    }

    if (temp?.next?.next?.data == prevTo) {
      newNode.next = head;
      head = newNode;
      return;
    }

    while (temp != null && temp.next?.next?.next?.data != prevTo) {
      temp = temp.next;
    }
    newNode.next = temp?.next;
    temp?.next = newNode;
  }
}

void main() {
  SLinkedList? list = SLinkedList();
  list.display();
  list.addNode(5);
 
  list.insertBefore2Elements(3434, 600);
  list.display();
}
class Node {
  Node(this.data);
  int? data;
  Node? next;
}

class SLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node? newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void insertAfter2Elements(int nextTo, int data) {
    Node? newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }

    if (temp?.next == null ||
        temp?.next?.next == null ||
        temp?.next?.next?.next == null) {
      print("Sorry.. Insertion not possible!");
      return;
    }
    newNode.next = temp?.next?.next?.next;
    temp?.next?.next?.next = newNode;
  }
}

void main() {
  SLinkedList? list = SLinkedList();
  list.display();
  list.addNode(5);
  list.addNode(6);
  list.addNode(7);
  list.addNode(8);
  list.addNode(9);
  list.addNode(10);
  list.addNode(11);
  list.addNode(12);
  list.addNode(13);
  list.addNode(14);
  list.addNode(15);
  list.insertAfter2Elements(14, 600);
  list.display();
}
