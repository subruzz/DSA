// // List<int> merge(List<int> arr1, List<int> arr2) {
// //   List<int> combinedArray = [];
// //   int j = 0;
// //   int i = 0;
// //   while (i < arr1.length && j < arr2.length) {
// //     if (arr1[i] < arr2[j]) {
// //       combinedArray.add(arr1[i]);
// //       i++;
// //     } else {
// //       combinedArray.add(arr2[j]);
// //       j++;
// //     }
// //   }
// //   while (i < arr1.length) {
// //     combinedArray.add(arr1[i]);
// //     i++;
// //   }
// //   while (j < arr2.length) {
// //     combinedArray.add(arr2[j]);
// //     j++;
// //   }
// //   return combinedArray;
// // }

// // List<int> mergeSort(List<int> array) {
// //   if (array.length == 1) return array;
// //   int midIndex = array.length ~/ 2;
// //   List<int> left = mergeSort(array.sublist(0, midIndex));
// //   List<int> right = mergeSort(array.sublist(midIndex));
// //   return merge(left, right);
// // }

// void main() {
//   // print(mergeSort([4, 10, 1, 0, 3, 6, 5]));
//   print(mergeSort([4, 6, 1, 7, 3, 2, 5]));
// }

// List<int> mergeSort(List<int> arr) {
//   if (arr.length == 1) return arr;
//   int midIndex = arr.length ~/ 2;
//   List<int> left = mergeSort(arr.sublist(0, midIndex));
//   List<int> right = mergeSort(arr.sublist(midIndex));

//   return merge(left, right);
// }

// List<int> merge(List<int> arr1, List<int> arr2) {
//   List<int> combined = [];
//   int i = 0;
//   int j = 0;
//   while (i < arr1.length && j < arr2.length) {
//     if (arr1[i] < arr2[j]) {
//       combined.add(arr1[i]);
//       i++;
//     } else {
//       combined.add(arr2[j]);
//       j++;
//     }
//   }
//   while (i < arr1.length) {
//     combined.add(arr1[i]);
//     i++;
//   }
//   while (j < arr2.length) {
//     combined.add(arr2[j]);
//     j++;
//   }
//   return combined;
// }

List<int> mergeSort(List<int> arr) {
  if (arr.length == 1) return arr;
  int m = arr.length ~/ 2;
  List<int> left = mergeSort(arr.sublist(0, m));
  List<int> right = mergeSort(arr.sublist(m));
  return merge(left, right);
}

List<int> merge(List<int> arr1, List<int> arr2) {
  int i = 0;
  int j = 0;
  List<int> combined = [];
  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      combined.add(arr1[i]);
      i++;
    } else {
      combined.add(arr2[j]);
      j++;
    }
  }
  while (i < arr1.length) {
    combined.add(arr1[i]);
    i++;
  }
  while (j < arr2.length) {
    combined.add(arr2[j]);
    j++;
  }
  return combined;
}

class Linkedlist {
  Node? head;
  Node? tail;
  void append(int value) {
    Node node = Node(value);
    if (head == null) {
      tail = node;
      head = node;
    } else {
      tail!.next = node;
      tail = node;
    }
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

class Node {
  Node? next;
  int value;
  Node(this.value);
}
  
void main() {
  print(mergeSort([4, 2, 6, 3, 7, 2]));
}

Node? mergeSor(Node? head) {
  if (head?.next == null) return head;
  Node? mid = findMiddle(head);
  Node? leftHead = head;
  Node? rightHead = mid!.next;
  mid.next = null;

  Node? left = mergeSor(leftHead);
  Node? right = mergeSor(rightHead);
  return mergeLL(left, right);
}

Node? findMiddle(Node? head) {
  Node? slow = head;
  Node? fast = head;

  while (fast?.next != null) {
    slow = slow!.next;
    fast = fast?.next?.next;
  }
  return slow;
}

Node? mergeLL(Node? head1, Node? head2) {
  Node? temp1 = head1;
  Node? temp2 = head2;
  Node? node = Node(0);
  Node? dummy = node;

  while (temp1 != null && temp2 != null) {
    if (temp1.value < temp2.value) {
      dummy!.next = temp1;
      temp1 = temp1.next;
    } else {
      dummy!.next = temp2;
      temp2 = temp2.next;
    }
    dummy = dummy.next;
  }
  if (temp1 != null) {
    dummy!.next = temp1;
  } else {
    dummy!.next = temp2;
    // tail = otherList.getTail();
  }
  head1 = node.next;
  return node.next;
}
