import 'dart:collection';
import 'dart:math';

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

  bool insert(int value) {
    Node node = Node(value);
    Node? temp = root;
    if (root == null) {
      root = node;
      return true;
    }
    while (true) {
      if (temp!.value == value) return false;
      if (value < temp.value) {
        if (temp.left == null) {
          temp.left = node;
          return true;
        }
        temp = temp.left;
      } else {
        if (temp.right == null) {
          temp.right = node;
          return true;
        }
        temp = temp.right;
      }
    }
  }

  bool rContains(int value, Node? temp) {
    if (temp == null) return false;
    if (temp.value == value) return true;
    if (value < temp.value) {
      temp = temp.left;
    } else {
      temp = temp.right;
    }
    return rContains(value, temp);
  }

  bool contains(int value) {
    Node? temp = root;
    while (temp != null) {
      if (temp.value == value) return true;
      if (value < temp.value) {
        temp = temp.left;
      } else {
        temp = temp.right;
      }
    }
    return false;
  }

  Node? rDelete(int value, Node? temp) {
    if (temp == null) return null;
    if (value < temp.value) {
      temp.left = rDelete(value, temp.left);
    } else if (value > temp.value) {
      temp.right = rDelete(value, temp.right);
    } else {
      if (temp.right == null && temp.left == null)
        return null;
      else if (temp.left == null)
        temp = temp.right;
      else if (temp.right == null)
        temp = temp.left;
      else {
        int min = minValue(temp.right);
        temp.value = min;
        temp.right = rDelete(min, temp.right);
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

  int heightOfNode(Node? temp) {
    if (temp == null) return 0;
    int leftheight = heightOfNode(temp.left);
    int rightHeight = heightOfNode(temp.right);
    return max(leftheight, rightHeight) + 1;
  }

  List<int> BFS() {
    Node? temp;
    List<int> result = [];
    Queue<Node?> queue = Queue<Node?>();
    queue.add(root);
    while (queue.isNotEmpty) {
      temp = queue.removeFirst();
      result.add(temp!.value);
      if (temp.left != null) {
        queue.add(temp.left);
      }
      if (temp.right != null) {
        queue.add(temp.right);
      }
    }
    return result;
  }

  List<int> result = [];
  void preOrder(Node? temp) {
    if (temp == null) return;
    result.add(temp.value);
    preOrder(temp.left);
    preOrder(temp.right);
  }

  void postOrder(Node? temp) {
    if (temp == null) return;
    postOrder(temp.left);
    postOrder(temp.right);
    result.add(temp.value);
  }

  void inOrder(Node? temp) {
    if (temp == null) return;
    inOrder(temp.left);
    result.add(temp.value);
    inOrder(temp.right);
  }
}

void main() {
  BST bst = BST();
  bst.insertR(40);
  bst.insertR(30);
  bst.insertR(50);
  bst.insertR(35);
  bst.insertR(45);
  bst.insertR(60);
  bst.insertR(32);
  bst.insertR(20);
  bst.insertR(10);
  bst.insertR(25);
  bst.inOrder(bst.root);
  print(bst.result);
}
