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
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  int findSum() {
    int sum = 0;
    Node? temp = head;
    while (temp != null) {
      sum += temp.value;
      temp = temp.next;
    }
    return sum;
  }
}

void main() {
  LinkedList list = LinkedList(4);
  list.append(6);
  list.append(7);
  list.append(9);
  list.display();
  print('sum is ${list.findSum()}');
}
