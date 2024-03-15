 class A{
  public static void main(String[] args) {
    System.out.println(" " + fun(200) + " ");

  }
  static void fun1(int n) 
  { 

     int i = 0;   
     if (n > 1) 
       fun1(n - 1); 
     for (i = 0; i < n; i++) 
       System.out.print(" * ");
       System.out.println('\n'); 
  } 
  // static void fun(int x) 
  // { 
  //     if(x > 0) 
  //     { 
  //         fun(--x); 
  //         System.out.print(x + " "); 
  //         fun(--x); 
  //     } 
  // } 
  static int fun(int i)
  {
      if (i % 2 == 1) {
        
        System.out.println(1/2);
        return i++;
      }
      else {
        return fun(fun(i - 1));}
  }
   
  
}