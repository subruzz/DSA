void main() {
  List<int> list = [1, 2, 3, 3, 1];
  for (int i = 1; i < list.length; i++) {
    if (list[i - 1] > list[i]) {
      print('Not sorted');
      return;
    }
  }
  print('array is sorted');
}
