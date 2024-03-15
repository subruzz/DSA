class Node {
  int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  int length = 0;

  LinkedList(int value) {
    Node node = Node(value);
    head = tail = node;
    length = 1;
  }
//to add value at the last
  void append(int value) {
    Node node = Node(value);
    if (head == null) {
      head = tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }
    length++;
  }

  //to add value at the front
  void prepend(int value) {
    Node node = Node(value);
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  void getHead() {
    if (head == null) {
      print("Head: null");
    } else {
      print("Head: ${head!.value}");
    }
  }

  void getTail() {
    if (tail == null) {
      print("Tail: null");
    } else {
      print("Tail: ${tail!.value}");
    }
  }

  int getLength() {
    return length;
  }
}

void main() {
  LinkedList myLinkedList = LinkedList(4);
  myLinkedList.append(8);
  print("\nLinked List:");
  myLinkedList.printList();
}
