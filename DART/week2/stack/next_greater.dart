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
  List<int> arr = [4, 5, 2, 10, 8];
  List<int> res = [];
  Stack stack = Stack();
  //nearest smallest to left

  for (int i = 0; i < arr.length; i++) {
    while (stack.isNotEmpty && stack.top > arr[i]) {
      stack.pop();
    }
    if (stack.isEmpty) {
      res.add(-1);
    } else
      res.add(stack.top);
    // if (stack.isEmpty) {
    //   res.add(-1);
    // } else if (stack.top < arr[i]) {
    //   res.add(stack.top);
    // } else {
    //   while (stack.isNotEmpty && stack.top > arr[i]) {
    //     stack.pop();
    //   }
    //   if (stack.isEmpty)
    //     res.add(-1);
    //   else
    //     res.add(stack.top);
    // }
    stack.push(arr[i]);
  }
  print(res);
  //nearest smallest to left
  for (int i = 0; i < arr.length; i++) {
    if (stack.isEmpty) {
      res.add(-1);
    } else if (stack.top > arr[i]) {
      res.add(stack.top);
    } else {
      while (stack.isNotEmpty && stack.top < arr[i]) {
        stack.pop();
      }
      if (stack.isEmpty)
        res.add(-1);
      else
        res.add(stack.top);
    }
    stack.push(arr[i]);
  }
}
