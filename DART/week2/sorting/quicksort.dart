void swap(List<int> arr, int fIndex, int sIndex) {
  int temp = arr[fIndex];
  arr[fIndex] = arr[sIndex];
  arr[sIndex] = temp;
}

int pivot(List<int> arr, int pivotIndex, int endIndex) {
  int swapIndex = pivotIndex;
  for (int i = pivotIndex + 1; i < endIndex; i++) {
    if (arr[i] < arr[pivotIndex]) {
      swapIndex++;
      swap(arr, swapIndex, i);
    }
  }
  // print('$pivotIndex and $endIndex');
  // print(arr);
  swap(arr, swapIndex, pivotIndex);
  return swapIndex;
}

void quickSort(List<int> arr, int sIndex, int eIndex) {
  // print('startIndex $sIndex');

  if (sIndex >= eIndex) return; 

  int pIndex =
      pivot(arr, sIndex, eIndex); 

  quickSort(arr, sIndex, pIndex - 1);
  quickSort(arr, pIndex + 1, eIndex);
}

void main() {
  List<int> arr = [4, 6, 1, 7, 3, 2, 5];
  quickSort(arr, 0, arr.length);
  print(arr);
}
