class Node {
  int value;
  Node? next;
  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  LinkedList(value) {
    Node node = Node(value);
    head = node;
    tail = node;
  }
  void append(value) {
    Node node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }
  }

  void sortLLbs() {
    if (head == null || head?.next == null) return;
    Node? sortUntil = null;
    while (sortUntil != head!.next) {
      Node? c = head;
      while (c?.next != sortUntil) {
        if (c!.value > c.next!.value) {
          int temp = c.value;
          c.value = c.next!.value;
          c.next!.value = temp;
        }
        c = c.next;
      }
      sortUntil = c;
    }
  }

  void selectionSort() {
    if (head == null || head?.next == null) return;

    Node? temp = head;
    while (temp?.next != null) {
      Node? current = temp;
      Node? n = temp!.next;
      while (n != null) {
        if (current!.value > n.value) {
          current = n;
        }
        n = n.next;
      }
      int v = temp.value;
      temp.value = current!.value;
      current.value = v;

      temp = temp.next;
    }
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
  LinkedList list = LinkedList(4);
  list.append(3);
  list.append(2);

  list.append(1);

  list.selectionSort();
  list.display();
}
