class Stack {
  List<int> _stack = [];

  void push(int value) {
    _stack.add(value);
  }

  void pop() {
    if (_stack.isEmpty) {
      print('cant pop');
    } else {
      _stack.removeLast();
    }
  }

  int get top => _stack.last; 
  bool get isEmpty => _stack.isEmpty;
  bool get isNotEmpty => !isEmpty;
}

void main() {
  List<int> arr = [100, 80, 110, 120, 70, 75];
  Stack stack = Stack();
  List<int> res = [];

  for (int i = 0; i < arr.length; i++) {
    while (stack.isNotEmpty && arr[stack.top] < arr[i]) {
      stack.pop();
    }
    if (stack.isEmpty) {
      res.add(i + 1);
    } else {
      res.add(i - stack.top);
    }
    stack.push(i);
  }
  print(res);

  // for (int i = 0; i < arr.length; i++) {
  //   while (stack.isNotEmpty && arr[stack.top] <= arr[i]) {
  //     stack.pop();
  //   }
  //   int c = stack.isEmpty ? i + 1 : i - stack.top;
  //   res.add(c);
  //   stack.push(i);

  // }
}
