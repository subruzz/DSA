void main() {
  List<int> arr = [4, 1, 2, 3, 6, 9];
  List<String> arr1 = ['banana', 'apple', 'orange', 'grape', 'kiwi'];
  sortStringList(arr1);
  print(arr1);
}

void sortNumberList(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int flag = 0;
    for (int j = 0; j < arr.length - 1 - i; j++) {
      if (arr[j + 1] < arr[j]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        flag = 1;
      }
    }
    if (flag == 0) return;
  }
}

void sortStringList(List<String> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int flag = 0;
    for (int j = 0; j < arr.length - 1 - i; j++) {
      int c = arr[j].compareTo(arr[j + 1]);
      if (c == 1) {
        String temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        flag = 1;
      }
    }
    if (flag == 0) return;
  }
}

void sortNumberListrec(List<int> arr, int n) {
  if (n == 0) return;
  for (int j = 0; j < n; j++) {
    if (arr[j + 1] < arr[j]) {
      int temp = arr[j];
      arr[j] = arr[j + 1];
      arr[j + 1] = temp;
    }

    sortNumberListrec(arr, n - 1);
  }
}
//linkedlist sorting

