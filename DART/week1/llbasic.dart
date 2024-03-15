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

  void delete(int value) {
    Node? current = head, prev;
    if (current != null && current.data == value) {
      head = current.next;
      return;
    }
    while (current != null && current.data != value) {
      prev = current;
      current = current.next;
    }
    if (current == null) {
      return;
    }
    if (current == tail) {
      tail = prev;
      tail!.next = null;
      return;
    }
    prev!.next = current.next;
  }

  void insert(int nextTo, int data) {
    Node? newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }

    if (temp == tail) {
      tail!.next = newNode;
      tail = newNode;
      return;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }

  void deletewithIndex(int index) {
    Node? current = head, prev;

    int count = 0;

    if (index == 0) {
      current = current!.next;
      head = current;
    } else {
      while (current != null && count < index) {
        prev = current;
        current = current.next;
        count++;
      }
      if (current == null) {
        return;
      }
      if (current == tail) {
        tail = prev;
        tail!.next = null;
        return;
      }
      prev!.next = current.next;
    }
  }

  void displayReverse(Node? head) {
    if (head?.next == null) {
      print(head?.data);
      return;
    }
    displayReverse(head?.next!);
    print(head?.data);
  }

  void reverse() {
    Node? prev;
    Node? current = head;

    while (current != null) {
      Node? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  void replaceWithData(int fromData, int toData) {
    Node? temp = head;
    while (temp != null && temp.data != fromData) {
      temp = temp.next;
    }
    temp?.data = toData;
  }
}

void main() {
  SLinkedList? list = SLinkedList();

  list.addNode(1);
  list.addNode(2);
  list.addNode(3);
  list.addNode(4);

  list.addNode(5);

  // list.display();
  list.displayReverse(list.head);
}
