void main() {
  List<int> arr = [2, 3, 7, 9, 13, 23, 100];
  print(upperbound(arr, 13));
}

int binarysearch(List<int> arr, int value) {
  int l = 0;
  int ans = -1;
  int h = arr.length - 1;
  int mid = 0;
  while (l <= h) {
    mid = (l + h) ~/ 2;
    if (arr[mid] == value) {
      ans = mid;
    }
    if (arr[mid] < value) {
      l = mid + 1;
    } else {
      h = mid - 1;
    }
  }
  return ans;
}

int rec(
  List<int> arr,
  int value,
  int l,
  int h,
) {
  if (l > h) return -1;
  int mid = (l + h) ~/ 2;
  if (arr[mid] == value) return mid;
  if (arr[mid] > value) {
    return rec(arr, value, l, h - 1);
  } else {
    return rec(arr, value, l + 1, h);
  }
}

int lowerBound(List<int> arr, int value) {
  int l = 0;
  int ans = 0;
  int h = arr.length - 1;
  int mid = 0;
  while (l <= h) {
    mid = (l + h) ~/ 2;
    if (arr[mid] >= value) {
      ans = mid;

      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}
int upperbound(List<int> arr, int value) {
  int l = 0;
  int ans = 0;
  int h = arr.length - 1;
  int mid = 0;
  while (l <= h) {
    mid = (l + h) ~/ 2;
    if (arr[mid] > value) {
      ans = mid;

      h = mid - 1;
    } else {
      l = mid + 1;
    }
  }
  return ans;
}
