class TrieNode {
  TrieNode({this.key, this.parent});
  // 1
  int? key;
  // 2
  TrieNode? parent;
  // 3
  Map<int, TrieNode?> children = {};
  // 4
  bool isTerminating = false;
}

class StringTrie {
  TrieNode root = TrieNode();

  void insert(String text) {
    // 1
    var current = root;
    // 2
    for (var codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }
    // 3
    current.isTerminating = true;
  }

  bool contains(String text) {
    var current = root;

    for (var codeUnit in text.codeUnits) {
      if (!current.children.containsKey(codeUnit)) {
        return false;
      }
      current = current.children[codeUnit]!;
    }
    if (current.isTerminating) return true;
    return false;
  }

  bool startsWith(String text) {
    var current = root;

    for (var codeUnit in text.codeUnits) {
      if (!current.children.containsKey(codeUnit)) {
        return false;
      }
      current = current.children[codeUnit]!;
    }
    return true;
  }

  void delete(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      if (!current.children.containsKey(codeUnit)) {
        return;
      }
      current = current.children[codeUnit]!;
    }
    if (!current.isTerminating) {
      return;
    }
    current.isTerminating = false;

    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children.remove(current.key);
      current = current.parent!;
    }
  }

  void findAllWords(List<String> words, String prefix, TrieNode root) {
    if (root.isTerminating) words.add(prefix);
    for (var i in root.children.keys) {
      findAllWords(words, prefix + String.fromCharCode(i), root.children[i]!);
    }
  }

  void findWords() {
    List<String> words = [];
    findAllWords(words, '', root);
    print(words);
  }

  void stPrefix(String prefix) {
    List<String> result = [];

    var c = root;
    for (var i in prefix.codeUnits) {
      if (!c.children.containsKey(i)) {
        return;
      }
      c = c.children[i]!;
    }
    findAllWords(result, prefix, c);
    print(result);
  }

  List<String> retrieveByPrefix(String prefix) {
    var current = root;
    List<String> words = [];

    // Traverse the trie to the node representing the prefix
    for (var codeUnit in prefix.codeUnits) {
      if (!current.children.containsKey(codeUnit)) {
        // Prefix not found
        return [];
      }
      current = current.children[codeUnit]!;
    }

    // At this point, 'current' represents the node corresponding to the prefix
    // Call a recursive function to collect all terminating words starting from this node
    findAllWords(words, prefix, current);

    return words;
  }
}

void main() {
  StringTrie trie = StringTrie();
  trie.insert('hel');
  trie.insert('hi');
  trie.insert('he');
  trie.insert('text');
  trie.stPrefix('he');
  print(trie.retrieveByPrefix('he'));
}
