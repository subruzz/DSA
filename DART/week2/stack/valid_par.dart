
void main() {
  String s = '(()';
  StackWithArray stack = StackWithArray();
  stack.balanceParanthesis(s);
}

class StackWithArray {
  int top = -1;
  List<String> _stack = [];
  void push(String value) {
    _stack.add(value);
  }

  void pop() {
    if (_stack.isEmpty) return;
    _stack.removeLast();
  }

  balanceParanthesis(String s) {
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        push(s[i]);
      } else if (s[i] == ')') {
        if (_stack.isEmpty) {
          print('not balanced');
          return;
        }
        pop();
      }
    }
    if (_stack.isEmpty) {
      print('balanced paranthesis');
    } else {
      print('not balanced');
    }
  }
}
