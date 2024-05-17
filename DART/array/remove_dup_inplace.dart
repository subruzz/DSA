void main() {
  List<int> list = [1, 1, 2, 2, 2, 3, 3, 3];
  int index = 0;//to keep track of it
  ///here what we do is we compare current index of list with our variable 
  ///our variable index so whenever its not same we will swap and increment
  ///the index so it will be jumbing to next place where next unique 
  ///element needs to be
  for (int i = 1; i < list.length; i++) {
    if (list[index] != list[i]) {
      list[index + 1] = list[i];
      index++;
    }
  }
  print('unique elements are $index');
  print(list);
}
