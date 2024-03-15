void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7];

  // reverseArray(0, arr);
  // print(arr);
  // print(palindromeCheck(0, 'heooeh'));
  // printUptoN(5); // print(findArraySum(
  //   arr,
  // ));[\
  // print(fibonacci(4));
  // printUptoN(20);
  // print(arraySum(arr, 0));
  // print(findArraySum(arr));
  // print(sumOfDigits(8888));
  // reverseNumber(513);

  // print(reverse);
  // countNumberOfZeroes(0209089060);
  // print(count);
  print(checkArraySortOrNot([1, 2, 3, 1, 5, 5], 1));
}

void printUptoN(int n) {
  if (n == 0) return;
  print(n);
  printUptoN(n - 1);
  print(n);
}

int sum(int n) {
  if (n == 0) return 0;
  return n + (sum(n - 1));
}

int fact(int n) {
  if (n == 1) return 1;

  return n * (fact(n - 1));
}

int arraySum(List<int> arr, int l) {
  if (l == arr.length) return 0;
  return arr[l] + arraySum(arr, l + 1);
}

void reverseArray(l, arr) {
  if (l >= arr.length / 2) return;
  int temp = arr[l];
  arr[l] = arr[arr.length - 1 - l];
  arr[arr.length - 1 - l] = temp;
  reverseArray(l + 1, arr);

  // for (int i = 0; i < arr.length / 2; i++) {
  //   int temp = arr[i];
  //   arr[i] = arr[arr.length - 1 - i];
  //   arr[arr.length - 1 - i] = temp;
  // }
}

bool palindromeCheck(int l, String s) {
  if (l >= s.length / 2) return true;

  if (s[l] != s[s.length - 1 - l]) return false;

  return palindromeCheck(l + 1, s);
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }
  int sum = fibonacci(n - 1) + fibonacci(n - 2);

  return sum;

  // int n = 10;
  // int a = 0, b = 1;
  // print(a);
  // print(b);
  // int temp = 0;
  // for (int i = 3; i <= 10; i++) {
  //   temp = a + b;
  //   print(temp);
  //   a = b;
  //   b = temp;
  // }
}

int findArraySum(List<int> arr) {
  if (arr.isEmpty) return 0;
  return arr.first + findArraySum(arr.sublist(1));
}

int sumOfDigits(int value) {
  if (value == 0) return 0;
  int n = value % 10;
  int newValue = value ~/ 10;
  return n + sumOfDigits(newValue);
}

int reverse = 0;
void reverseNumber(
  int value,
) {
  if (value == 0) return;

  int n = value % 10;
  int newValue = value ~/ 10;
  reverse = (reverse * 10) + n;
  reverseNumber(newValue);
}

int count = 0;
void countNumberOfZeroes(int v) {
  if (v == 0) return;

  int n = v % 10;
  int newValue = v ~/ 10;
  if (n == 0) count++;
  countNumberOfZeroes(newValue);
}

bool checkArraySortOrNot(List<int> arr, int i) {
  if (i >= arr.length) return true;
  if (arr[i] < arr[i - 1]) {
    return false;
  }
  return checkArraySortOrNot(arr, i + 1);
  // if (arr[i] > arr[i - 1]) {
  //   return true;
  // }
}
