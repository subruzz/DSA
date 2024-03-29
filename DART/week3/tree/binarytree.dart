// import '../../week1/arrtoll.dart';

// class TreeNode {
//   late int val;
//   TreeNode? left;
//   TreeNode? right;

//   TreeNode(this.val);
// }

// class BinaryTree {
//   TreeNode? root;

//   // void insert(int value) {
//   //   root = _insertRecursively(root, value);
//   // }

//   // TreeNode _insertRecursively(TreeNode? node, int value) {
//   //   if (node == null) {
//   //     TreeNode node = TreeNode(value);
//   //     return node;
//   //   }

//   //   if (node.left == null) {
//   //     node.left = _insertRecursively(node.left, value);
//   //   } else if (node.right == null) {
//   //     node.right = _insertRecursively(node.right, value);
//   //   } else {
//   //     // If both left and right children are not null, recursively insert into left subtree
//   //     node.left = _insertRecursively(node.left, value);
//   //   }
//   //   print('return node is ${node.val}');
//   //   return node;
//   // }

//   void preOrderTraversal(TreeNode? node) {
//     if (node != null) {
//       print(node.val);
//       preOrderTraversal(node.left);
//       preOrderTraversal(node.right);
//     }
//   }
// }

// void main() {
//   var tree = BinaryTree();

//   // Inserting nodes into the binary tree
//   tree.insert(5);
//   tree.insert(3);
//   tree.insert(2);
//   tree.insert(1);
//   tree.insert(4);
//   tree.insert(6);
//   tree.insert(8);
//   // Performing pre-order traversal
//   print("Pre-order Traversal:");
//   tree.preOrderTraversal(tree.root);
// }
