class Node {
  int value;
  Node? next;
  Node? prev;
  Node(this.value);
}

class DoubleLinkedList {
  Node? head;
  Node? tail;
  int length = 0;
  DoubleLinkedList(int value) {
    Node node = Node(value);
    head = node;
    tail = node;
    length = 1;
  }

  void append(int value) {
    Node node = Node(value);

    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.prev = tail;
      tail!.next = node;
      tail = node;
    }
  }

  void prepend(int value) {
    Node node = Node(value);

    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
    }
  }

  void removeFirst() {
    if (head == null) return;
    if (head!.next == null) {
      head = null;
      tail = null;
    } else {
      head = head!.next;
      head!.prev = null;
    }
  }

  void removeLast() {
    if (head == null) return;
    if (head!.next == null) {
      head = null;
      tail = null;
    } else {
      Node? temp = tail;
      tail = temp!.prev;
      temp.prev = null;
      tail!.next = null;
    }
  }

  void reverse() {
    Node? temp = head;
    head = tail;
    tail = temp;
    while (temp != null) {
      Node? next = temp.next;
      temp.next = temp.prev;
      temp.prev = next;
      temp = next;
    }

    // Update the head and tail pointers
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
  DoubleLinkedList dl = DoubleLinkedList(1);
  dl.append(2);
  dl.append(3);
  dl.append(4);
  dl.append(5);
  dl.reverse();
  // dl.removeFirst();
  dl.display();
}
