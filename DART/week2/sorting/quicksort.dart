int pivot(List<int> arr, int pivotIndex, int endIndex) {
  int swapIndex = pivotIndex;
  for (int i = pivotIndex + 1; i < endIndex; i++) {
    if (arr[pivotIndex] > arr[i]) {
      swapIndex++;
      int temp = arr[i];
      arr[i] = arr[swapIndex];
      arr[swapIndex] = temp;
    }
    int temp = arr[swapIndex];
    arr[swapIndex] = arr[pivotIndex];
    arr[pivotIndex] = temp;
  }
  return swapIndex;
}

void main() {
  List<int> list = [4, 6, 1, 7, 3, 2, 5];
  print(pivot(list, 0, list.length));
}
