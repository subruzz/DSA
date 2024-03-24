class Node {
  Node? next;
  int value;
  Node(this.value);
}

class Linkedlist {
  Node? head;
  Node? tail;
  void append(int value) {
    Node node = Node(value);
    if (head == null) {
      tail = node;
      head = node;
    } else {
      tail!.next = node;
      tail = node;
    }
  }

  void bubbleSort() {
    if (head == null || head!.next == null) return;
    Node? upto = null;
    while (upto != head!.next) {
      Node? temp = head;
      while (temp != null && temp.next != upto) {
        if (temp.value > temp.next!.value) {
          int v = temp.value;
          temp.value = temp.next!.value;
          temp.next!.value = v;
        }
        temp = temp.next;
      }
      upto = temp;
    }
  }

  void selectionSort() {
    if (head == null || head?.next == null) return;
    Node? temp = head;
    while (temp?.next != null) {
      Node? after = temp?.next;
      Node? c = temp;
      while (after != null) {
        if (after.value < c!.value) {
          c = after;
        }
        after = after.next;
      }
      int val = temp!.value;
      temp.value = c!.value;
      c.value = val;
      temp = temp.next;
    }
  }

  void insertionSort() {
    Node? temp = head;
    Node? after = head?.next;
    while(after!=null){
      
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
  Linkedlist list = Linkedlist();
  list.append(4);
  list.append(1);
  list.append(3);
  list.append(8);
  list.append(6);
  list.selectionSort();
  list.display();
}
