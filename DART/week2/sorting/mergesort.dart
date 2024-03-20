List<int> merge(List<int> arr1, List<int> arr2) {
  List<int> combinedArray = [];
  int j = 0;
  int i = 0;
  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      combinedArray.add(arr1[i]);
      i++;
    } else {
      combinedArray.add(arr2[j]);
      j++;
    }
  }
  while (i < arr1.length) {
    combinedArray.add(arr1[i]);
    i++;
  }
  while (j < arr2.length) {
    combinedArray.add(arr2[j]);
    j++;
  }
  return combinedArray;
}

List<int> mergeSort(List<int> array) {
  if (array.length == 1) return array;

  int midIndex = array.length ~/ 2;
  List<int> left = mergeSort(array.sublist(0, midIndex));
  List<int> right = mergeSort(array.sublist(midIndex));

  return merge(left, right);
}

void main() {
  print(mergeSort([4, 6, 2, 9, 2, 4, 11]));
}