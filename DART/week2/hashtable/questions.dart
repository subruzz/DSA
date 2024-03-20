bool itemCommon(List<int> arr1, List<int> arr2) {
  Set<int> set = arr1.toSet();
  for (int i = 0; i < arr2.length; i++) {
    if (set.contains(arr2[i])) {
      return true;
    }
  }
  return false;
}

List<int> findDuplicate(List<int> arr) {
  List<int> result = [];
  Map<int, int> dup = {};
  for (int i = 0; i < arr.length; i++) {
    if (dup.containsKey(arr[i])) {
      dup[arr[i]] = dup[arr[i]]! + 1;
    } else {
      dup[arr[i]] = 1;
    }
  }
  for (var i in dup.keys) {
    if (dup[i]! > 1) {
      result.add(i);
    }
  }
  return result;
}

String? firstNonRepear(String s) {
  Map<String, int> map = {};
  for (int i = 0; i < s.length; i++) {
    if (map.containsKey(s[i])) {
      // return map.keys.first;
      map[s[i]] = map[s[i]]! + 1;
    } else {
      map[s[i]] = 1;
    }
  }
  for (int i = 0; i < s.length; i++) {
    if (map[s[i]] == 1) return s[i];
  }
  return null;
}

List<int> twoSum(List<int> arr, int target) {
  Map<int, int> map = {};
  for (int i = 0; i < arr.length; i++) {
    int num = target - arr[i];
    if (map.containsKey(arr[i])) {
      return [ map[arr[i]]!,arr[i]];
    }
    map[num] = arr[i];
  }
  return [];
}

void main() {
  // print(firstNonRepear('hheelloo'));
  List<int> arr = [3, 4, 3];
  print(twoSum(arr, 7)); // print(findDuplicate(arr));
  // List<int> arr1 = [3, 4, 2, 5];
  // List<int> arr2 = [6, 9, 8, 9];
  // print(itemCommon(arr1, arr2));
}
