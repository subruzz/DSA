void main() {
  StackWithArray stack = StackWithArray();
  stack.push(4);
  stack.push(3);
  stack.push(2);
  stack.push(1);
  stack.pop();
  stack.display();
}

class StackWithArray {
  int top = -1;
  List<int> _stack = [];

  void push(int value) {
    top++;
    _stack.add(value);
  }

  void pop() {
    if (_stack.isEmpty) {
      print('nothing to remove');
    } else {
      _stack.removeLast();
    }
  }

  void display() {
    int n = _stack.length - 1;
    for (int i = n; i >= 0; i--) {
      print(_stack[i]);
    }
  }
}
