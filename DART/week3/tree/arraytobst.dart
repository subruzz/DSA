class Node {
  int value;
  Node? right;
  Node? left;
  Node(this.value);
}

class BST<T> {
  Node? root;
  void insertR(int value) {
    if (root == null) {
      root = Node(value);
      return;
    }
    rInsert(value, root);
  }

  Node rInsert(int value, Node? temp) {
    if (temp == null) {
      return Node(value);
    }

    if (value < temp.value) {
      temp.left = rInsert(value, temp.left);
    } else {
      temp.right = rInsert(value, temp.right);
    }
    return temp;
  }

//   void rArrToBst(List<int> arr) {
//     if (arr.isEmpty) return;
//     if (arr.length == 1) {
//       this.insertR(arr.first);
//       return;
//     }

//     int m = arr.length ~/ 2;
//     this.insertR(arr[m]);
//     rArrToBst(arr.sublist(0, m));
//     rArrToBst(arr.sublist(m + 1));
//   }

  Node? rArrToBst(List<int> arr) {
    if (arr.isEmpty) return null;
    int m = arr.length ~/ 2;

    Node node = Node(arr[m]);
    node.left = rArrToBst(arr.sublist(0, m));
    node.right = rArrToBst(arr.sublist(m + 1));
    return node;
  }
}

void main() {
  BST bst = BST();
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8];
  print(bst.rArrToBst(arr)?.right?.value);
  // print(bst.root?.right?.right?.right?.value);
}
