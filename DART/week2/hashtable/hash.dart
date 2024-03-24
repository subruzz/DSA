// class Node<String, int> {
//   String key;
//   int value;
//   Node? next;
//   Node(this.key, this.value);
// }

// class HashTable {
//   int size = 7;
//   List<Node?> dataMap = [];

//   HashTable() {
//     dataMap = List<Node?>.filled(size, null);
//   }
//   int hash(String key) {
//     int hash = 0;
//     List<int> keyChars = key.runes.toList();
//     // Convert String to a list of Unicode code points
//     for (int i = 0; i < keyChars.length; i++) {
//       int asciiValue = keyChars[i];
//       hash = (hash + asciiValue * 23) % dataMap.length;
//     }
//     return hash;
//   }

//   int get(String key) {
//     int index = hash(key);
//     Node? temp = dataMap[index];
//     while (temp != null) {
//       if (temp.key == key) return temp.value;
//       temp = temp.next;
//     }
//     return 0;
//   }

//   void set(String key, int value) {
//     Node node = Node(key, value);
//     int index = hash(key);
//     if (dataMap[index] == null) {
//       dataMap[index] = node;
//     } else {
//       Node? temp = dataMap[index];
//       while (temp?.next != null) {
//         temp = temp?.next;
//       }
//       temp!.next = node;
//     }
//   }

//   void printTable() {
//     for (int i = 0; i < dataMap.length; i++) {
//       print('$i:');
//       Node? temp = dataMap[i];
//       while (temp != null) {
//         print('   {${temp.key}= ${temp.value}}');
//         temp = temp.next;
//       }
//     }
//   }

//   List<String> getAllKeys() {
//     List<String> allKeys = [];
//     for (int i = 0; i < dataMap.length; i++) {
//       if (dataMap[i] != null) {
//         Node? temp = dataMap[i];
//         while (temp != null) {
//           allKeys.add(temp.key);
//           temp = temp.next;
//         }
//       }
//     }
//     return allKeys;
//   }
// }

// void main() {
//   HashTable table = HashTable();
//   table.set('key1', 1);
//   table.set('key1', 10);

//   table.set('key2', 2);
//   table.set('key3', 3);
//   table.set('key4', 4);
//   table.printTable();
//   table.getAllKeys();
//   // print(table.get('key4'));
// }
class Node<K, V> {
  V value;
  K key;
  Node<K, V>? next;
  Node(this.key, this.value);
}

class Hashtable<K, V> {
  int size = 2;
  List<Node<K, V>?> dataMap = [];
  int capacit = 0;
  Hashtable() {
    dataMap = List.filled(size, null);
  }
  int hash(K key) {
    return key.hashCode % dataMap.length;
  }

  void put(K key, V value) {
    if (capacit == size) {
      print('Array is full');
      return;
    }

    Node<K, V> node = Node(key, value);
    int index = hash(key);

    // Handle collision using linear probing
    while (dataMap[index] != null) {
      // Check if the current slot is occupied by the same key
      if (dataMap[index]!.key == key) {
        // Update the value if the key already exists
        dataMap[index]!.value = value;
        return;
      }
      index = (index + 1) % dataMap.length; // Linearly probe to the next slot
    }

    // Found an empty slot, insert the new node
    dataMap[index] = node;
    capacit++;
  }

  void set(K key, V value) {
    Node<K, V> node = Node(key, value);
    int index = hash(key);
    if (dataMap[index] != null) {
      Node? temp = dataMap[index];
      while (temp?.next != null) {
        temp = temp?.next;
      }
      temp?.value = value;
    } else {
      dataMap[index] = node;
    }
  }

  V? get(K key) {
    int index = hash(key);

    Node<K, V>? temp = dataMap[index];
    while (temp != null) {
      if (temp.key == key) {
        return temp.value;
      }
      temp = temp.next; // Move
    }
    return null;
  }

  void display() {
    for (int i = 0; i < dataMap.length; i++) {
      print(i);

      if (dataMap[i] != null) {
        print('   {${dataMap[i]!.key}= ${dataMap[i]!.value}}');
      }
    }
  }

  void printTable() {
    for (int i = 0; i < dataMap.length; i++) {
      print('$i:');
      Node? temp = dataMap[i];
      while (temp != null) {
        print('   {${temp.key}= ${temp.value}}');
        temp = temp.next;
      }
    }
  }
}

void main() {
  Hashtable<String, int> ht = Hashtable();
  ht.put('key1', 5);
  ht.put('key1', 45);
  ht.put('kdey1', 45);
  ht.put('kefy1', 45);

  ht.display();
}
