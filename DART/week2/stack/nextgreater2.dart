List<int> nextGreaterElement(List<int> nums) {
  List<int> result = List<int>.filled(nums.length, -1);
  List<int> stack = [];

  for (int i = 0; i < nums.length; i++) {
    while (stack.isNotEmpty && nums[i] > nums[stack.last]) {
      result[stack.removeLast()] = nums[i];
    }
    stack.add(i);
  }

  return result;
}

void main() {
  List<int> arr = [1, 2, 2, 4, 7, 3, 6, 9];
  List<int> result = nextGreaterElement(arr);
  print("Next greater elements for each element in the array:");
  for (int i = 0; i < arr.length; i++) {
    print("${arr[i]} -> ${result[i]}");
  }
}
