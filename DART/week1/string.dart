void main() {
  if (linearSearch(["hi", "s", "ff", "1"], "ff")) {
    print('Found');
  } else {
    print("Not Found");
  }
}

bool linearSearch(List<String> list, String target) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return true;
    }
  }
  return false;
}
