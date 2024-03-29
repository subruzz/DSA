class Heap {
  List<int> heap = [];

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
    return List.from(heap);
  }

  void insert(int value) {
    heap.add(value);
    int current = heap.length - 1;
    int parentIndex = parent(current);

    while (current > 0 && heap[parentIndex] < heap[current]) {
      swap(parentIndex, current);
      current = parentIndex;
      parentIndex = parent(current);
    }
  }

  // void insert(int value) {
  //   heap.add(value);
  //   int current = heap.length - 1;
  //   while (current > 0 && heap[current] > heap[parent(current)]) {
  //     int parentIndex = parent(current);
  //     swap(current, parentIndex);
  //     current = parentIndex;
  //   }
  // }

  void swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  int? removeFromHeap() {
    if (heap.isEmpty) return null;
    if (heap.length == 1) return heap.removeAt(0);
    int root = heap[0];
    heap[0] = heap.removeLast();
    sinkDown(0);
    return root;
  }

  void sinkDown(int index) {
    int maxIndex = index;

    while (true) {
      int leftIndex = leftChild(index);
      int rightIndex = rightChild(index);

      // Compare with the left child
      if (leftIndex < heap.length && heap[leftIndex] > heap[maxIndex]) {
        maxIndex = leftIndex;
      }

      // Compare with the right child
      if (rightIndex < heap.length && heap[rightIndex] > heap[maxIndex]) {
        maxIndex = rightIndex;
      }

      // If the current node is not the maximum among its children
      if (maxIndex != index) {
        swap(index, maxIndex);
        index = maxIndex;
      } else {
        return;
      }
    }
  }

  void findKthSmallest(List<int> arr, int k) {
    List<int> arr = [3, 2, 3, 1, 2, 4, 5, 5, 6];
    int k = 5;
    for (int i = 0; i < k; i++) {
      insert(arr[i]);
    }
    for (int i = k; i < arr.length; i++) {
      if (arr[i] < getHeap()[0]) {
        removeFromHeap();
        insert(arr[i]);
      }
    }
  }
}

void main() {
  Heap heap = Heap();

  print('kth smallest is ${heap.getHeap()[0]}');
//   heap.removeFromHeap();

//   print(heap.getHeap());
//   heap.removeFromHeap();

//   print(heap.getHeap());
}
