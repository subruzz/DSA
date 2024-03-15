class Node {
  Node(this.data);
  var data;
  Node? next;
}

class SLinkedList {
  Node? head;
  Node? tail;
  void addNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  void removeDupilcates() {
    if (head == null) {
      print('The LinkedList is empty');
      return;
    }
    Node? current = head;
    while (current != null) {
      Node? nextNode = current.next;
      while (current?.data == nextNode?.data) {
        current?.next = current.next?.next;
        if(current?.data!=current?.next?.data){
          current = current?.next;
          }
      }
      current = current?.next;
    }
  }

  void display() {
    if (head == null) {
      print('The LinkedList is empty');
      return;
    }
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main(List<String> args) {
  SLinkedList sl = SLinkedList();
  sl.addNode(10);
  sl.addNode(10);
  sl.addNode(10);
  sl.addNode(40);
  sl.addNode(50);
  sl.removeDupilcates();
  sl.display();
}
