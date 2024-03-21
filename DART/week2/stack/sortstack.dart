void main() {
  StackWithArray stack = StackWithArray();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print('before sort');
  stack.display();
  print('after sort');
  stack.reverse();
  stack.display();
}

class StackWithArray {
  int top = -1;
  List<int> _stack = [];

  void push(int value) {
    top++;
    _stack.add(value);
  }

  void sortStack() {
    StackWithArray sortedStack = StackWithArray();
    while (!this.isEmpty) {
      int temp = this.pop;
      while (!sortedStack.isEmpty && temp < sortedStack.peek) {
        this.push(sortedStack.pop);
      }
      sortedStack.push(temp);
    }
    while (!sortedStack.isEmpty) {
      this.push(sortedStack.pop);
    }
  }
  void reverse() {
    if (this.isEmpty) return;
    int temp = this.pop;
    reverse();
    insertAtBottom(temp);
  }

  void insertAtBottom(int value) {
    if (this.isEmpty) {
      this.push(value);
    } else {
      int temp = this.pop;
      insertAtBottom(value);
      this.push(temp);
    }
    // StackWithArray rev = StackWithArray();

    // while (!this.isEmpty) {
    //   rev.push(this.pop);
    // }
    // this.push(value);
    // while (!rev.isEmpty) {
    //   this.push(rev.pop);
    // }
  }

  int get pop => _stack.removeLast();

  bool get isEmpty => _stack.isEmpty;
  int get peek => _stack.last;
  void display() {
    for (int i = _stack.length - 1; i >= 0; i--) {
      print(_stack[i]);
    }
  }
}
