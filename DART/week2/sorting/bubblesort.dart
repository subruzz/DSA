void bubbleSort(List<int> arr) {
  //also we can write
    for (int i = 0; i < arr.length-1 ; i++) {
    for (int j = 0; j < arr.length-i-1; j++) {
      int c = arr[j].compareTo(arr[j + 1]);
      if (c == 1) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  // for (int i = arr.length - 1; i >= 0; i--) {
  //   int flag = 0;
  //   print('enter');
  //   for (int j = 0; j < i; j++) {
  //     int c = arr[j].compareTo(arr[j + 1]);
  //     if (c == 1) {
  //       String temp = arr[j];
  //       arr[j] = arr[j + 1];
  //       arr[j + 1] = temp;
  //       flag = 1;
  //     }
  //   }
  //   if (flag == 0) break;
  // }
}

void recursiveBubble(List<int> ar, int n) {
  if (n == 0) return;
  int flag = 0;
  for (int j = 0; j < n - 1; j++) {
    if (ar[j] < ar[j + 1]) {
      int temp = ar[j];
      ar[j] = ar[j + 1];
      ar[j + 1] = temp;
      flag = 1;
    }
  }
  if (flag == 0) return;

  recursiveBubble(ar, n - 1);
}

void main() {
  List<int> ar = [
    2,
    4,
    6,
    5,
    1,
    3,
  ];
  List<String> arr = ['ap', 'bcf', 'cbe'];
  // bubbleSort(arr);
  // print(arr);
  bubbleSort(ar);
  print(ar);
}
