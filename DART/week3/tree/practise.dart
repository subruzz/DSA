import 'dart:collection';
import 'dart:ffi';

class Node {
  Node? left;
  Node? right;
  int value;
  Node(this.value);
}

class BST {
  Node? root;

  void insert(int value) {
    if (root == null) {
      root = Node(value);
      return;
    }
    rInsert(value, root);
  }

  Node rInsert(int value, Node? temp) {
    if (temp == null) return Node(value);

    if (value < temp.value) {
      temp.left = rInsert(value, temp.left);
    } else {
      temp.right = rInsert(value, temp.right);
    }
    return temp;
  }

  bool contains(Node? temp, int value) {
    if (temp == null) return false;
    if (temp.value == value) return true;
    if (value < temp.value)
      return contains(temp.left, value);
    else
      return contains(temp.right, value);
  }

  Node? delete(int value, Node? temp) {
    if (temp == null) return null;

    if (value < temp.value) {
      temp.left = delete(value, temp.left);
    } else if (value > temp.value) {
      temp.right = delete(value, temp.right);
    } else {
      if (temp.left == null && temp.right == null)
        return null;
      else if (temp.left == null)
        temp = temp.right;
      else if (temp.right == null)
        temp = temp.left;
      else {
        int min = minValue(temp.right);
        temp.value = min;
        temp.right = delete(min, temp.right);
      }
    }
    return temp;
  }

  int minValue(Node? temp) {
    while (temp?.left != null) {
      temp = temp?.left;
    }
    return temp!.value;
  }

  void preOrder(Node? temp) {
    if (temp == null) return;
    print(temp.value);
    preOrder(temp.left);
    preOrder(temp.right);
  }

  void BFS(Node? temp) {
    Queue<Node?> queue = Queue();
    queue.add(temp);
    while (queue.isNotEmpty) {
      temp = queue.removeFirst();
      print(temp!.value);
      if (temp.left != null) {
        queue.add(temp.left);
      }
      if (temp.right != null) {
        queue.add(temp.right);
      }
    }
  }

  int v = -1;
  void closestumber(int value, Node? root) {
    if (root == null) return;

    if (root.value < value) v = root.value;
    closestumber(value, root.left);
    closestumber(value, root.right);
  }
}

void main() {
  BST bst = BST();
  bst.insert(40);
  bst.insert(50);
  bst.insert(30);
  bst.insert(35);
  bst.insert(25);
  bst.insert(55);
  bst.closestumber(32, bst.root);
  print(bst.v);
  // bst.preOrder(bst.root);
}
