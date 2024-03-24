void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int j = i - 1;
    int temp = arr[i];
    while (j >= 0 && temp < arr[j]) {
      arr[j + 1] = arr[j];
      arr[j] = temp;
      j--;
    }
  }
}

class Stack {
  List<int> _stack = [];

  void push(int value) {
    _stack.add(value);
  }

  void pop() {
    if (isEmpty) return;
    _stack.removeLast();
  }

  void display() {
    for (int i = _stack.length-1; i >= 0; i--) {
      print(_stack[i]);
    }
  }

  int get peek => _stack.last;

  bool get isEmpty => _stack.isEmpty;
}

void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.pop();
  print('stack elements');
  stack.display();
  print(
      'top of stack is ${stack.peek}'); // List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  // insertionSort(arr);
  // print(arr);
}
