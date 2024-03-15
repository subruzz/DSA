class Node {
  Node? next;
  int value;
  Node(this.value);
}

class Stack {
  Node? top;
  int height = 0;
  Stack(int value) {
    Node node = Node(value);
    top = node;
    height = 1;
  }
  void display() {
    Node? temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void push(int value) {
    Node node = Node(value);
    if (top == null) {
      top = node;
    } else {
      node.next = top;
      top = node;
    }
    height++;
  }

  Node? pop() {
    if (top == null) return null;
    Node temp = top!;
    top = top!.next;
    temp.next = null;
    height--;
    return temp;
  }
}

void main() {
  Stack stack = Stack(1);
  stack.push(2);
  stack.pop();
  // print(stack.pop()!.value);
  // print(stack.pop()!.value);
  // print(stack.pop());

  stack.display();
}
