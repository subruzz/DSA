class Node<T> {
  T value;
  Node<T>? next;
  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int length = 0;

  //append value to last
  void append(T value) {
    Node<T>? node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      tail!.next = node;
      tail = node;
    }
    length++;
  }

  //to add value at the front
  void prepend(T value) {
    Node<T>? node = Node(value);
    if (head == null) {
      head = node;
      tail = node;
    } else {
      node.next = head;
      head = node;
    }
    length++;
  }

// to remove first element
  Node? removeFirst() {
    if (head == null) return null;
    Node<T> current = head!;

    if (head!.next == null) {
      head = null;
      tail = null;
    } else {
      head = head!.next;
      current.next = null;
    }
    length--;
    return current;
  }

//delete the node with given value
  Node? deleteValue(T value) {
    if (head == null) return null;
    Node<T>? temp = head;
    Node<T>? prev = head;
    if (head!.value == value) {
      head = head!.next;
      temp!.next = null;
      return temp;
    }
    while (temp != null && temp.value != value) {
      prev = temp;
      temp = temp.next;
    }

    if (temp == null) return null;
    if (temp == tail) {
      tail = prev;
      tail!.next = null;
      print('${tail!.value} value is thisf tail');

      return temp;
    }
    prev!.next = temp.next;
    temp.next = null;
    return temp;
    // print(temp.value);
  }

  void deletIn(int index) {
    if (head == null) return null;
    if (index == 0) {
      head = head?.next;
      return;
    }
    int i = 0;
    Node<T>? temp = head;
    while (i < index - 1 && temp?.next != null) {
      temp = temp?.next;
      i++;
    }
    if (temp == null) {
      print('index out of range');
      return;
    }
    if (temp.next == tail) {
      tail = temp;
      tail?.next = null;
    }
    temp.next = temp.next?.next;
    print(tail?.value);
  }

  void reverse() {
    Node<T>? prev = null;
    Node<T>? current = head;
    Node<T>? after = current?.next;
    head = tail;
    tail = current;

    while (current != null) {
      after = current.next;

      current.next = prev;
      prev = current;
      current = after;
    }
  }

  void insertAfterTwo(T newValue, int check) {
    Node<T> node = Node(newValue);
    if (head == null) return;
    Node<T>? fast = head!.next?.next;
    Node<T>? slow = head;

    while (fast != null) {
      if (slow!.value == check) {
        break;
      }
      fast = fast.next;
      slow = slow.next;
    }
    if (fast == null) return;
    if (fast == tail) {
      tail!.next = node;
      tail = node;
    } else {
      node.next = fast.next;
      fast.next = node;
    }
  }

  void insertBeforeTwo(T data, int value) {
    Node<T>? current = head;
    Node<T>? prev = null;
    if (head == null) return;

    // Find the node with 'value' and its next node
    while (current != null) {
      if (current.value == value) {
        break;
      }
      prev = current;
      current = current.next;
    }
    if (current == null) return;
    Node<T> node = Node(data);
    if (prev == null) {
      node.next = head;
      head = node;
      return;
    }
    // Insert the new node between prev and current
    prev.next = node;
    node.next = current;
    // Node<T> node = Node(data);

    // if (head == null) return;

    // Node<T>? fast = head;
    // if (fast!.next?.next?.value == value) {
    //   node.next = head;
    //   head = node;
    //   return;
    // }
    // fast = fast.next?.next?.next;
    // Node<T>? slow = head;
    // while (fast != null && fast.value != value) {
    //   fast = fast.next;
    //   slow = slow!.next;
    // }
    // if (fast != null) {
    //   node.next = slow!.next;
    //   slow.next = node;
    // }
  }

  void replaceAllspecifiedValue(T newValue, T currentValue) {
    if (head == null) return;
    Node<T>? temp = head;
    while (temp != null) {
      if (temp.value == currentValue) {
        temp.value = newValue;
      }
      temp = temp.next;
    }
  }

//completed
  void deleteAllNodeWithValue(int currntValue) {
    if (head == null) return;
    while (head != null && head!.value == currntValue) {
      head = head!.next;
    }
    Node<T>? temp = head;
    Node<T>? prev = head;
    while (temp != null) {
      if (temp.value == currntValue) {
        if (temp == tail) {
          tail = prev;
          tail!.next = null;
        } else {
          prev!.next = temp.next;
          temp.next = null;
          temp = prev.next;
        }
      } else {
        prev = temp;
        temp = temp.next;
      }
    }
    print('tail is ${tail?.value}');
  }

  // double average() {
  //   var sum = 0.0;
  //   int count = 0;
  //   double average = 0;
  //   if (head == null) return average;
  //   Node<T>? temp = head;
  //   while (temp != null) {
  //     count++;
  //     if (temp.value is num) {
  //       sum = sum + temp.value;
  //     }
  //   }
  // }
  void deleteLastocc(int value) {
    if (head == null) return;

    Node<T>? temp = head;
    Node<T>? last = head;
    while (temp?.next != null) {
      if (temp?.next?.value == value) {
        last = temp;
      }
      temp = temp?.next;
    }
    if (last == head && head!.value == value) {
      head = head!.next;
      return;
    }
    if (last == null) return;
    last.next = last.next?.next;
  }

  void delete(int value) {
    if (head == null) return;
    Node<T>? temp = head;
    Node<T>? prev = head;
    while (temp?.next != null && temp?.value != value) {
      prev = temp;

      temp = temp?.next;
    }
    if (temp == head && value == head?.value) {
      head = head?.next;
    } else if (temp == tail && tail?.value == value) {
      tail = prev;
      tail?.next = null;
    } else {
      prev?.next = temp?.next;
    }
    print(tail?.value);
    print(head?.value);
    print('\n\n\n');
  }

  void removeDuplicate() {
    Set set = {};
    if (head == null) return;
    Node<T>? temp = head;
    Node<T>? prev = null;
    while (temp != null) {
      if (set.contains(temp.value)) {
        prev!.next = temp.next;
      } else {
        set.add(temp.value);
        prev = temp;
      }
      temp = temp.next;
    }
  }

  //to display the linkedlist
  void display() {
    Node<T>? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(3);
  linkedList.deleteLastocc(1);
  linkedList.display();
}
