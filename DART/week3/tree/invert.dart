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

  void invertTree(Node? temp) {
    if (temp?.left == null || temp?.right == null) {
      return;
    }
    Node? node = temp?.left;
    temp?.left = temp.right;
    temp?.right = node;
    invertTree(temp?.left);
    invertTree(temp?.right);
  }
}

void main() {
  BST bst = BST();
}
