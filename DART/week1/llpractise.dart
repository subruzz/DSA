void main() {
  LinkedList list = LinkedList(10);
  list.appendNode(100);
  list.prepend(1);
  print(list.removeLast()!.value);

  print(list.removeLast()!.value);
  print(list.removeLast()!.value);
  print(list.removeLast());

  // list.printList();
}

class Node {
  int value;
  Node? next;
  Node({required this.value});
}

class LinkedList {
  Node? head;
  Node? tail;
  int length = 0;
  LinkedList(int value) {
    Node node = Node(value: value);
    head = node;
    tail = node;
    length = 1;
  }
  void printList() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void appendNode(int value) {
    Node node = Node(value: value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }

    length++;
    print('after appending last $length');
  }

  void prepend(int value) {
    Node node = Node(value: value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
    }
    length++;
    print('after preperning last $length');
  }

  Node? removeFirst() {
    if (head == null) return null;
    Node current = head!;
    head = head!.next;
    current.next = null;
    length--;
    if (length == 0) {
      tail = null;
    }
    length--;
    return current;
  }
 Node? removeLast() {
    if (head == null) {
      return null;
    }

    Node current = head!;
    Node prev = head!;

    while (current.next != null) {
      prev = current;
      current = current.next!;
    }

    tail = prev;
    tail!.next = null;
    length--;

    if (length == 0) {
      head = null;
      tail = null;
    }

    return current;
  }
  // Node? removeLast() {
  //   if (head == null) return null;

  //   Node prev = head!;
  //   Node current = head!;
  //   while (current.next != null) {
  //     prev = current;
  //     current = current.next!;
  //   }
  //   tail = prev;

  //   tail!.next = null;
  //   length--;
  //   print('after removeing  last $length');
  //   if (length == 0) {
  //     head == null;
  //     tail == null;
  //   }
  //   return current;
  // }
}
