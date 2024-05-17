void main() {
  //method 1: we can do this by iterating all array and add to set
  //method 2: we can create map and iterate all array and add if its not in the hashmap
  //method 3: using two pointer approach
  List<int> arr1 = [
    1,
    1,
    2,
    3,
    4,
    5,
    5,
  ];
  List<int> arr2 = [2, 3, 4, 6, 8];
  List<int> union = [];
  int firstP = 0;
  int secondP = 0;
  while (firstP < arr1.length && secondP < arr2.length) {
    if (arr1[firstP] < arr2[secondP]) {
      if (union.isEmpty || arr1[firstP] != union.last) {
        union.add(arr1[firstP]);
      }
      firstP++;
    } else {
      if (union.isEmpty || arr2[secondP] != union.last) {
        union.add(arr2[secondP]);
      }
      secondP++;
    }
  }
  print(union);
  while (firstP < arr1.length) {
    if (union.isEmpty || arr1[firstP] != union.last) {
      union.add(arr1[firstP]);
    }
    firstP++;
  }
  while (secondP < arr2.length) {
    if (union.isEmpty || arr2[secondP] != union.last) {
      union.add(arr2[secondP]);
    }
    secondP++;
  }

  print('union is $union');
}
