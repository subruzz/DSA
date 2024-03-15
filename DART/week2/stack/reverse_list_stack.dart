void main() {
  List<int> list = [1, 2, 3, 4, 5];
  StackWithArray stack = StackWithArray();
  stack.printInReverse(list);
}

class StackWithArray {
  int top = -1;
  List<int> _stack = [];
  void push(int value) {
    _stack.add(value);
  }

  int pop() => _stack.removeLast();
  void printInReverse(List<int> list) {
    var stack = StackWithArray();
    for (var value in list) {
      stack.push(value);
    }
    for (int i = list.length - 1; i >= 0;i--) {
      print(stack.pop());
    }
  }
}
