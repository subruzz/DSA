
public class ll1 {
    public static void main(String[] args) {
        LinkedList myLinkedList = new LinkedList(4);
        myLinkedList.append(8);
        myLinkedList.append(12);

        myLinkedList.append(16);

        myLinkedList.append(20);

        // System.out.println(myLinkedList.removeFirst().value);
        // System.out.println(myLinkedList.removeFirst().value);
        // System.out.println(myLinkedList.removeFirst());

        // myLinkedList.getHead()
        // myLinkedList.getTail();
        // myLinkedList.getLength();
        // System.out.println(myLinkedList.setElement(0, 300));
        // myLinkedList.insertElemetn(50, 0

        // );
        myLinkedList.reverse();;
        // myLinkedList.removeAtIndex(1);
        System.out.println("\nLinked List:");

        myLinkedList.printList();

        // System.out.println(myLinkedList.getElements(3).value);
    }
}

class LinkedList {

    private Node head;
    private Node tail;
    int length;

    class Node {
        int value;
        Node next;

        Node(int value) {
            this.value = value;
        }
    }

    public LinkedList(int value) {

        Node node = new Node(value);
        head = node;
        tail = node;
        length = 1;
    }

    Node removeAtIndex(int index) {
        if (index < 0 || index >= length)
            return null;
        if (index == 0) {
            return removeFirst();

        }
        if (index == length - 1) {
            return removeLast();
        }
        Node temp = getElements(index - 1);
        temp.next = temp.next.next;
        temp.next.next = null;
        length--;
        return temp.next;

    }

    void reverse() {
        Node temp=head;
        head=tail;
        tail=temp;
        Node  after=temp.next;
        Node before =null;
       for(int i=0;i<length;i++){
        after=temp.next;
        temp.next=before;
        before=temp;
        temp=after;
       }
    }
     
    public Node removeFirst() {
        if (head == null) {
            return null;
        }
        Node current = head;
        head = head.next;
        current.next = null;
        length--;
        if (length == 0) {
            tail = null;
        }
        return current;
    }

    public Node removeLast() {
        if (head == null) {
            return null;
        }
        Node current = head;
        Node prev = head;
        while (current.next != null) {
            prev = current;
            current = current.next;
        }
        tail = prev;
        tail.next = null;
        length--;
        // System.out.println("after eremoving last " + length);
        if (length == 0) {
            head = null;
            tail = null;
        }
        return current;
        // for (int i = 1; i <= length; i++) {
        // if (current.next.next == null) {
        // System.out.print("entered here");
        // System.out.println(current.next.next);
        // tail = current;
        // tail.next = null;
        // break;
        // }
        // current = current.next;

        // }
        // length--;
    }

    public void prepend(int value) {
        Node node = new Node(value);
        if (head == null) {
            head = node;
            tail = node;
        } else {
            node.next = head;
            head = node;
        }
        length++;
    }

    Node getElements(int index) {
        if (index < 0 || index >= length)
            return null;
        Node temp = head;
        for (int i = 0; i < index; i++) {
            temp = temp.next;
        }
        return temp;
    }

    boolean insertElemetn(int value, int index) {
        if (index < 0 || index > length) {
            return false;
        }

        if (index == 0) {
            prepend(value);
            return true;
        }
        if (index == length) {
            append(value);
            return true;
        }
        Node node = new Node(value);
        Node temp = getElements(index - 1);
        node.next = temp.next;
        temp.next = node;
        length++;
        return true;

    }

    boolean setElement(int index, int value) {
        Node temp = getElements(index);
        if (temp != null) {
            temp.value = value;
            return true;
        }
        return false;
    }

    public void append(int value) {
        Node node = new Node(value);
        if (head == null) {
            head = node;
            tail = node;
        } else {

            tail.next = node;
            tail = node;
        }
        length++;

    }

    public void printList() {
        Node temp = head;
        while (temp != null) {
            System.out.println(temp.value);
            temp = temp.next;
        }
    }

    public void getHead() {
        if (head == null) {
            System.out.println("Head: null");
        } else {
            System.out.println("Head: " + head.value);
        }
    }

    public void getTail() {
        if (head == null) {
            System.out.println("Tail: null");
        } else {
            System.out.println("Tail: " + tail.value);
        }
    }

    public void getLength() {
        // System.out.println("Length: " + length);
    }

}

// // THIS GOES IN YOUR MAIN CLASS TO TEST YOUR CODE:
// // -----------------------------------------------

// package datastructures.linkedlist;

// public class Main {

// public static void main(String[] args) {

// LinkedList myLinkedList = new LinkedList(1);
// myLinkedList.append(2);

// // (2) Items - Returns 2 Node
// System.out.println(myLinkedList.removeLast().value);
// // (1) Item - Returns 1 Node
// System.out.println(myLinkedList.removeLast().value);
// // (0) Items - Returns null
// System.out.println(myLinkedList.removeLast());

// /*
// EXPECTED OUTPUT:
// ----------------
// 2
// 1
// null

// */

// }

// }

// // THIS CODE GOES IN YOUR LINKEDLIST CLASS:
// // ----------------------------------------

// package datastructures.linkedlist;

// public class LinkedList {

// private Node head;
// private Node tail;
// private int length;

// class Node {
// int value;
// Node next;

// Node(int value) {
// this.value = value;
// }
// }

// public LinkedList(int value) {
// Node newNode = new Node(value);
// head = newNode;
// tail = newNode;
// length = 1;
// }

// public void printList() {
// Node temp = head;
// while (temp != null) {
// System.out.println(temp.value);
// temp = temp.next;
// }
// }

// public void getHead() {
// if (head == null) {
// System.out.println("Head: null");
// } else {
// System.out.println("Head: " + head.value);
// }
// }

// public void getTail() {
// if (head == null) {
// System.out.println("Tail: null");
// } else {
// System.out.println("Tail: " + tail.value);
// }
// }

// public void getLength() {
// System.out.println("Length: " + length);
// }

// public void append(int value) {
// Node newNode = new Node(value);
// if (length == 0) {
// head = newNode;
// tail = newNode;
// } else {
// tail.next = newNode;
// tail = newNode;
// }
// length++;
// }

// public Node removeLast() {
// if (length == 0) return null;
// Node temp = head;
// Node pre = head;
// while(temp.next != null) {
// pre = temp;
// temp = temp.next;
// }
// tail = pre;
// tail.next = null;
// length--;
// if (length == 0) {
// head = null;
// tail = null;
// }
// return temp;
// }

// }
