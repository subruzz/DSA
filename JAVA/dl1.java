
public class dl1 {
  public static void main(String[] args) {
    DoubleLinkedList myLinkedList = new DoubleLinkedList(4);
    myLinkedList.append(5);
  }
}

class DoubleLinkedList {
  private Node head;
  private Node tail;
  private int length;

  DoubleLinkedList(int value) {
    Node node = new Node(value);
    head = node;
    tail = node;
    length = 1;
  }

  void printDl() {
    Node temp = head;
    while (temp != null) {
      System.out.println(temp.value);
      temp = temp.next;
    }
  }

  void append(int value) {
    Node node = new Node(value);
    if (head == null) {
      head = node;
      tail = node;

    } else {
      node.prev = tail;
      tail.next = node;
      tail = node;
    }
    length++;
  }

  Node removeLast() {
    if (head == null)
      return null;
    Node current = tail;
    if (length == 1)

    {
      tail = null;
      head = null;
    } else {
      tail = current.prev;
      tail.next = null;
      current.prev = null;
    }
    length--;
    return current;
    // // if(length==1){
    // // Node current=head;
    // // head=null;
    // // tail=null;
    // // return current;
    // // }
    // Node current=tail;
    // tail=tail.prev;
    // if(tail==null){
    // Node c=head;
    // tail=null;
    // head=null;
    // return c;
    // }
    // tail.next=null;
    // current.prev=null;
    // length--;

    // return current;

  }
  void prepend(int value){
    Node node=new Node(value);
    if(head==null) {
    head=node;
    tail=node;
    }
    else{
      node.next=head;
      head.prev=node;
      
      head=node;
    }
  }
  Node removeFirst(){
    if(head==null)return null;
    Node current=head;

    if(length==1){
      head=null;
      tail=null;
    }
    else{
      head=head.next;
      head.prev=null;
      current.next=null;
    }
    return current;
  }
  Node get(int index){
    if(index<0||index>=length)return null;
    Node temp=head;
    if(index<length/2){
      
      for(int i=0;i<index;i++)
          {
         temp=temp.next;
    } 
  }    
    else{
      temp=tail;

      for(int i=length-1;i>index;i--){
        temp=temp.prev;
      }
    }
    return temp;
  }
   boolean set(int  value,int index){
     Node temp=get(index);
     if(temp!=null){
      temp.value=value;
      return true;
     }
     return false;
  }
  boolean insertAt(int index,int value){
    if(index<0||index>length)return false;
    Node node=new Node(value);
    if(index==0){
      prepend(value);
      return true;
    }
    if(index==length){
      append(value);
      return true;
    }
    Node temp=get(index-1);
    node.next=temp.next;
    node.prev=temp;
    temp.next.prev=node;
    temp.next=node;
    length++;
    return true;
  }
  Node removeAt(int index){
    if(index<0||index>=length)return null;
    if(index==0)return removeFirst();
    if(index==length-1)removeLast();
    Node temp=get(index);
    temp.prev.next=temp.next;
    temp.next.prev=temp.prev;
    temp.next=null;
    temp.prev=null;
    length--;
    // Node current=temp.next;
    // temp.next=current.next;
    // current.next=null;
    // current.prev=null;
    return temp;
  }
  class Node {
    int value;
    Node next;
    Node prev;

    Node(int value) {
      this.value = value;
    }
  }
}
