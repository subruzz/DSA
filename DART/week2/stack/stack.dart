class Node {
  Node? next;
  int? value;
  Node(this.value);
}

class Stack {
  Node? top;
  int height = 0;

  void display() {
    Node? temp = top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void reverseStack() {}
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

  void deleteMiddlde() {
    int mide = height ~/ 2;
    List<int> temp = [];
    for (int i = 1; i <= mide; i++) {
      temp.add(this.pop()!.value!);
    }
    this.pop();
    for (int i = temp.length - 1; i >= 0; i--) {
      this.push(temp[i]);
    }
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
  Stack stack = Stack();
  stack.push(2);
  stack.push(4);
  stack.push(6);
  stack.push(8);
  stack.push(10);
  stack.deleteMiddlde();
  // print(stack.pop()!.value);
  // print(stack.pop()!.value);
  // print(stack.pop());

  stack.display();
}
