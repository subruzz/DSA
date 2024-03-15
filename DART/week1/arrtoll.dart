class Node {
  int value;
  Node? next;
  Node(this.value);
}

class LinkedList {
  Node? head;
  Node? tail;
  int length = 0;

  void addElements(List<int> arr) {
    for (int i = 0; i < arr.length; i++) {
      addNode(arr[i]);
    }
  }

  void addNode(int value) {
    Node? node = Node(value);
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
}

void main() {
  List<int> arr = [1, 3, 4, 5, 6, 7];
  LinkedList linkedList = LinkedList();
  linkedList.addElements(arr);
  linkedList.display();
}
