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
      tail!.next = node;
      tail = node;
    }
    length++;
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
    length++;
  }

  Node? removeFirst() {
    if (head == null) return null;

    Node temp = head!;
    if (head!.next == null) {
      head = null;
      tail = null;
    } else {
      head = head!.next;
      temp.next = null;
    }
    length--;
    return temp;
  }

  Node? removeLast() {
    if (head == null) return null;
    Node? temp = head;
    Node? prev = head;
    if (head!.next == null) {
      head = null;
      tail = null;
      return temp;
    }
    while (temp?.next != null) {
      prev = temp;
      temp = temp?.next;
    }
    tail = prev;
    tail!.next = null;
    return temp;
  }

  void deleteByValue(int value) {
    if (head == null) return;

    while (head?.value == value) {
      if (head == null) {
        head = null;
        tail = null;
        print('out taile is ${tail?.value}');

        return;
      }
      head = head?.next;
    }

    Node? temp = head;
    while (temp != null) {
      if (temp.next?.value == value) {
        Node? current = temp.next;
        if (current == tail) {
          tail = temp;
          temp.next = null;
        }
        temp.next = temp.next?.next;
        current?.next = null;
      } else {
        temp = temp.next;
      }
    }
    print('out taile is ${tail?.value}');
  }

  void deleteByIndex(int i) {
    if (head == null) return;
    Node? temp = head;
    int c = 0;
    if (i == 0) {
      head = head!.next;
      temp!.next = null;
    }
    while (temp != null && c < i - 1) {
      temp = temp.next;
      c++;
    }
    if (temp == null || temp.next == null) {
      print('index out of range');
      return;
    }
    if (temp == tail) {
      tail = temp;
      tail!.next = null;
    }
    temp.next = temp.next?.next;
  }

  void reverse() {
    if (head == null) return;
    Node? c = head;
    Node? p = null;
    Node? a = head;
    head = tail;
    tail = c;
    while (c != null) {
      a = c.next;
      c.next = p;
      p = c;
      c = a;
    }
  }

  void insertTWo(int value, int nextTo) {
    if (head == null) return;
    Node node = Node(value);
    Node? fast = head!.next?.next;
    Node? slow = head!;
    while (fast != null) {
      if (slow!.value == nextTo) {
        if (fast == tail) {
          tail!.next = node;
          node.next = null;
        } else {
          node.next = fast.next?.next;

          fast.next = node;
        }
        return;
      }
      fast = fast.next;
      slow = slow.next;
    }
    if (fast == null) return;
  }

  void deleteLast(int value) {
    if (head == null) return;
    Node? temp = head;
    Node? last = null;
    while (temp?.next != null) {
      if (temp?.next?.value == value) {
        last = temp;
      }

      temp = temp?.next;
    }
    if (last == null && head!.value == value) {
      head = head!.next;
      return;
    }
    if (last == null) return;
    last.next = last.next?.next;
  }

  void removeDuplicate() {
    if (head == null) return;
    Node? temp = head;
    Node? prev = null;
    Set<int> set = {};
    while (temp != null) {
      if (set.contains(temp.value)) {
        prev!.next = temp.next;
        temp = prev.next;
      } else {
        set.add(temp.value);
        prev = temp;
        temp = temp.next;
      }
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
  LinkedList linkedList = LinkedList(1);
  linkedList.append(1);

  linkedList.append(3);
  linkedList.append(4);

  linkedList.append(3);
  // linkedList.append(12);
  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(3);

  linkedList.append(4);

  linkedList.append(6);
  linkedList.append(4);

  linkedList.removeDuplicate(); // linkedList.append(12);
  // linkedList.deleteByIndex(6);
  print('Linked list is');
  linkedList.display();
  // print('after reverse');
  // linkedList.reverse();
  // linkedList.display();
}
