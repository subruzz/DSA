class HeapSort {
  void heapSort(List<int> arr) {
    BuildMaxHeap(arr, arr.length);
    print(arr);
    for (int i = arr.length - 1; i >= 0; i--) {
      swap(arr, 0, i);
      heapify(0, arr, i);
    }
  }
}

void BuildMaxHeap(List<int> arr, int size) {
  for (int i = (size ~/ 2) - 1; i >= 0; i--) {
    heapify(i, arr, size);
  }
}

void heapify(int index, List<int> arr, int size) {
  int maxIndex = index;
  int leftIndex = leftChild(index);
  int rightIndex = rightChild(index);
  if (leftIndex < size && arr[leftIndex] > arr[maxIndex]) {
    maxIndex = leftIndex;
  }
  if (rightIndex < size && arr[rightIndex] > arr[maxIndex]) {
    maxIndex = rightIndex;
  }
  if (maxIndex != index) {
    swap(arr, maxIndex, index);
    index = maxIndex;
    heapify(index, arr, size);
  } else {
    return;
  }
}

void swap(List<int> arr, int index1, int index2) {
  int temp = arr[index1];
  arr[index1] = arr[index2];
  arr[index2] = temp;
}

int leftChild(int index) {
  return (2 * index) + 1;
}

int rightChild(int index) {
  return (2 * index) + 2;
}

int parent(int index) {
  return (index - 1) ~/ 2;
}

void main() {
  List<int> arr = [10, 5, 8, 15, 2, 9];
  print("Original array: $arr");
  HeapSort()..heapSort(arr);
  print("Sorted array: $arr");
}
