class CircularQueue {
  late List<int> _queue;
  int _front = 0;
  int _rear = -1;
  int _size = 0;
  final int _capacity;

  CircularQueue(int capacity) : _capacity = capacity {
    _queue = List.filled(capacity, 0);
  }

  bool isEmpty() {
    return _size == 0;
  } 

  bool isFull() {
    return _size == _capacity;
  }

  void enqueue(int item) {
    if (isFull()) {
      print("Queue is full. Enqueue operation failed.");
      return;
    }
    _rear = (_rear + 1) % _capacity;
    _queue[_rear] = item;
    _size++;
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue is empty. Dequeue operation failed.");
      return -1;
    }
    int dequeuedItem = _queue[_front];
    _front = (_front + 1) % _capacity;
    _size--;
    return dequeuedItem;
  }

  int peek() {
    if (isEmpty()) {
      print("Queue is empty. Peek operation failed.");
      return -1;
    }
    return _queue[_front];
  }

  void display() {
    if (isEmpty()) {
      print("Queue is empty.");
      return;
    }
    int index = _front;
    while (index != _rear) {
      print(_queue[index]);
      index = (index + 1) % _capacity;
    }
    print(_queue[_rear]);
  }
}

void main() {
  CircularQueue queue = CircularQueue(5);

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  queue.enqueue(5);
  // queue.enqueue(4);

  // queue.display(); // Output: 1 2 3 4
  queue.dequeue();
  queue.display();
  // print("Front element: ${queue.peek()}"); // Output: Front element: 1

  // queue.dequeue();
  // queue.dequeue();

  // queue.enqueue(5);
  // queue.enqueue(6);

  // queue.display(); // Output: 3 4 5 6
}
