// class Entry<K, V> {
//   Entry(this.key, this.value);
//   K key;
//   V value;
// }

// class HashTable<K, V> {
//   int size;
//   int length = 0;
//   late List<Entry<K, V>> listOfEntry;
//   HashTable(this.size) {
//     listOfEntry = List.filled(size, null);
//   }

//   int getIndex(K key) => key.hashCode % size;

//   void put(K key, V value) {
//     if (length >= size) {
//       print('OverFlow');
//       return;
//     }
//     int index = getIndex(key);
//     if (listOfEntry[index]?.key == key) {
//       listOfEntry[index]?.value = value;
//       return;
//     }
//     for (int i = 0; i < listOfEntry.length; i++) {
//       if (listOfEntry[index + i] == null) {
//         length++;
//         listOfEntry[index + i] = Entry(key, value);
//         return;
//       }
//     }
//   }

//   V? getValue(K key) {
//     int index = getIndex(key);
//     for (int i = 0; i < listOfEntry.length; i++) {
//       if (listOfEntry[index + i]?.key == key) {
//         return listOfEntry[index + i]?.value;
//       }
//     }
//     return null;
//   }

//   void remove(K key) {
//     if (length < 1) {
//       print('No value present in the Hashtable');
//       return;
//     }
//     int index = getIndex(key);
//     for (int i = 0; i < listOfEntry.length; i++) {
//       if (listOfEntry[index + i]?.key == key) {
//         listOfEntry[index + i] = null;
//         length--;
//         return;
//       }
//     }
//   }
// }

// void main(List<String> args) {
//   HashTable ht = HashTable<String,int>(10);
//   ht.put('a', 1);
//   ht.put('b', 2);
//   ht.remove('a');
//   print(ht.getValue('a'));
//   print(ht.getValue('b'));
// }
