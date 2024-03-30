class MaxHeap {
  List<int> maxHeap = [];

  int leftChild(int index) {
    return (2 * index) + 1;
  }

  int rightChild(int index) {
    return (2 * index) + 2;
  }

  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  void swap(int index1, int index2) {
    int temp = maxHeap[index1];
    maxHeap[index1] = maxHeap[index2];
    maxHeap[index2] = temp;
  }

  void insert(int value) {
    maxHeap.add(value);
    int current = maxHeap.length - 1;
    int parentIndex = parent(current);
    while (current >= 0 && maxHeap[current] > maxHeap[parentIndex]) {
      swap(current, parentIndex);
      current = parentIndex;
      parentIndex = parent(current);
    }
  }

  void remove() {
    if (maxHeap.isEmpty) return;
    if (maxHeap.length == 1) {
      maxHeap.removeLast();
      return;
    }
    maxHeap.removeAt(0);
    sinkDown(0);
  }

  sinkDown(int index) {
    int maxIndex = index;
    int leftIndex = leftChild(index);
    int rightIndex = rightChild(index);
    if (maxHeap[leftIndex] > maxHeap[maxIndex]) {
      maxIndex = leftIndex;
    }
    if (maxHeap[rightIndex] > maxHeap[maxIndex]) {
      maxIndex = rightIndex;
    }
    if (maxIndex != index) {
      swap(maxIndex, index);
      index = maxIndex;
    } else {
      return;
    }
    sinkDown(index);
  }
}

void main() {
  MaxHeap heap = MaxHeap();
  heap.insert(40);
  heap.insert(30);
  heap.insert(25);
  heap.insert(20);
  print(heap.maxHeap);
}
