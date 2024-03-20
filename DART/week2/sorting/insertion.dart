void main() {
  List<int> arr = [4, 2, 6, 5, 1, 3];
  insertion(arr);
  print(arr);
}

void iSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j>-1&&arr[j] > temp) {
      arr[j+1] = arr[j];
      arr[j] = temp;
      j--;
    }
  }
}

void insertion(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    for (int j = i; j > 0; j--) {
      if (arr[j] < arr[j - 1]) {
        int temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
      } else {
        break;
      }
    }
  }
}
