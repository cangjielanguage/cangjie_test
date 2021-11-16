// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(arg: Int32) : Int32

unsafe func main() {
  if(A.a()(5) == 5){
    return 0;
  }
  return 1;
}

class A{
  static func a(){
    return isMoment
  }
}
