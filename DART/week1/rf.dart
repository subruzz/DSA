void main() {
  // List<int> arr = [1, 2, 3, 4];
  // reverseArray(arr, 0, arr.length - 1);
  // print(arr);
  print(checkSor([1, 8, 3, 3, 4], 0));
}

int fact(int n) {
  if (n == 1) return 1;
  return n * (fact(n - 1));
}

int arraySum(List<int> arr, int i) {
  if (i == arr.length) return 0;
  return arr[i] + arraySum(arr, i + 1);
}

void reverseArray(List<int> arr, int l, int h) {
  if (l > h) return;
  int temp = arr[l];
  arr[l] = arr[h];
  arr[h] = temp;
  reverseArray(arr, l + 1, h - 1);
}

int s = 0;
void reverse(int n) {
  if (n == 0) return;
  int r = n % 10;
  int newV = n ~/ 10;
  s = (s * 10) + r;
  reverse(newV);
}

bool checkSor(List<int> arr, int i) {
  if (i == arr.length-1) return true;
  if (arr[i] > arr[i + 1]) {
    return false;
  }
  return checkSor(arr, i + 1);
}
