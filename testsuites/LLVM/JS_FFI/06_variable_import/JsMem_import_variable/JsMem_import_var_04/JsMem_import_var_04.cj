// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign let a : UInt16 

unsafe func main() {
  if(A().b() == 4){
    return 0;
  }
  return 1;
}

class A{
  func b(){
    return a
  }
}


