
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
