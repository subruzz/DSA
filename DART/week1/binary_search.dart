

void main() {
  List<int> arr = [1, 2, 3, 5, 5, 5, 5, 8, 9, 10];

  print(binarySearchlowerBound(arr, 9));
  // print(searchInsertPosition([2, 4, 8, 8, 8, 11, 13], 8));
}

int binarySearchlowerBound(List<int> arr, value) {
  int h = arr.length - 1;
  int l = 0;
  int ans = h;
  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (value <= arr[mid]) {
      ans = mid;
    }
    // print(ans);
    if (arr[mid] >= value) {
      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}

int binarySearchRecursion(List<int> arr, int l, int h, int value) {
  if (l > h) return -1;

  int mid = (l + h) ~/ 2;
  if (arr[mid] == value) return mid;
  if (value > arr[mid]) {
    l = mid + 1;
    return binarySearchRecursion(arr, l, h, value);
  } else {
    h = mid - 1;
    return binarySearchRecursion(arr, l, h, value);
  }
}

int binarySearch(int value, List<int> arr) {
  int s = 0;
  int e = arr.length - 1;
  while (s <= e) {
    int mid = (s + e) ~/ 2;
    if (arr[mid] == value) return mid;
    if (value > arr[mid]) {
      s = mid + 1;
    } else {
      e = mid - 1;
    }
  }
  return -1;
}
//time complexity and  Space Complexity: O(log n)

int recursionBinary(List<int> arr, value, int l, int h) {
  if (l > h) return -1;
  int mid = (l + h) ~/ 2;
  if (arr[mid] == value) return mid;
  if (arr[mid] < value) {
    l = mid + 1;

    return recursionBinary(arr, value, l, h);
  } else {
    h = mid - 1;
    return recursionBinary(arr, value, l, h);
  }
}

int binarySearchUpperBound(List<int> arr, value) {
  int h = arr.length - 1;
  int l = 0;
  int ans = h;
  while (l <= h) {
    print('enereed');
    int mid = (l + h) ~/ 2;
    if (arr[mid] > value) {
      ans = mid;
    }

    if (arr[mid] > value) {
      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}

int searchInsertPosition(List<int> arr, value) {
  int h = arr.length - 1;
  int l = 0;
  int ans = h;

  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (value == arr[mid]) {
      return mid;
    }
    if (arr[mid] > value) {
      h = mid - 1;
      ans = mid;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}

(int, int) floorAndCeil(List<int> arr, int value) {
  int l = 0;
  int h = arr.length - 1;
  int floor = -1;
  int ceil = -1;

  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (arr[mid] == value) return (arr[mid], arr[mid]);
    if (arr[mid] >= value) {
      h = mid - 1;
      ceil = arr[mid];
    } else {
      l = mid + 1;
      floor = arr[mid];
    }
    // if (arr[mid] <= value) {
    //   l = mid + 1;
    //   floor = arr[mid];
    // } else {
    //   h = mid - 1;
    //   ceil = arr[mid];
    // }
  }
  return (floor, ceil);
}

void firstOccurance(List<int> arr, int v) {
  int l = 0;
  int h = arr.length - 1;
  int first = -1;

  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (arr[mid] == v) {
      first = mid;
      h = mid - 1;
    } else if (arr[mid] > v) {
      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  print('first occurance is $first');
}

void numberOfOccurance(List<int> arr, int v) {
  int l = 0;
  int h = arr.length - 1;
  int c = 0;

  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (arr[mid] == v) {
      c++;
      h = mid - 1;
    } else if (arr[mid] > v) {
      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  print('first occurance is $c');
}
