void main() {
  List<int> list = [4, 6, 9, 12, -1];
  List<int> res = [list[0]];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > res.last) {
      for (int k = res.last + 1; k <= list[i]; k++) {
        res.add(k);
      }
    } else {
      for (int k = res.last-1; k >= list[i]; k--) {
        res.add(k);
      }
    }
  }
  print(res);
}
