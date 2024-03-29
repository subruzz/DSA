class MinHeap {
  List<int> minHeap = [];

  int leftChild(int index) {
    return 2 * index + 1;
  }

  int rightChild(int index) {
    return 2 * index + 2;
  }

  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  List<int> getHeap() {
    return List.from(minHeap);
  }

  void insert(int value) {
    minHeap.add(value);
    int current = minHeap.length - 1;
    int parentIndex = parent(current);
    while (current > 0 && minHeap[current] < minHeap[parentIndex]) {
      swap(parentIndex, current);
      current = parentIndex;
      parentIndex = parent(current);
    }
  }

  int? remove() {
    if (minHeap.isEmpty) return null;
    if (minHeap.length == 1) return minHeap.removeLast();
    int root = minHeap.first;
    minHeap[0] = minHeap.removeLast();
    sinkDown(0);
    return root;
  }

  void sinkDown(int index) {
    int minIndex = index;
    while (true) {
      int leftIndex = leftChild(index);
      int rightIndex = rightChild(index);
      if (leftIndex < minHeap.length &&
          minHeap[leftIndex] < minHeap[minIndex]) {
        minIndex = leftIndex;
      }
      if (rightIndex < minHeap.length &&
          minHeap[rightIndex] < minHeap[minIndex]) {
        minIndex = rightIndex;
      }
      if (minIndex != index) {
        swap(minIndex, index);
        index = minIndex;
      } else {
        break;
      }
    }
  }

  void swap(int index1, int index2) {
    int temp = minHeap[index1];
    minHeap[index1] = minHeap[index2];
    minHeap[index2] = temp;
  }
}
