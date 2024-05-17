void main() {
  List<int> list = [11, 1, 1, 1, 1, 1];
  int s = -1;
  int l = list[0];
  for (var i in list) {
    if (i > l) {
      s = l;
      l = i;
    } else if (i > s && i < l) {
      s = i;
    }
  }
  if (s == -1) {
    print('All numbers are equal');
    return;
  }
  print('Second largest is $s');
}
