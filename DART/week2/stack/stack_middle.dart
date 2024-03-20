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
