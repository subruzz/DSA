void main() {
  List<int> list = [1, 1, 1,0, 1, 1, 1,1, 0, 1, 1];
  int max = 0;
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == 1) {
      count++;
    } else {
      max = count > max ? count : max;
      count = 0;
    }
  }
  print('consec 1 is $max');
}
