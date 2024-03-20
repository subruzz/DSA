void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
      if (min != i) {
        int temp = arr[i];
        arr[i] = arr[min];
        arr[min] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = [2, 1, 6, 4];
  selectionSort(arr);
  print(arr);
}
