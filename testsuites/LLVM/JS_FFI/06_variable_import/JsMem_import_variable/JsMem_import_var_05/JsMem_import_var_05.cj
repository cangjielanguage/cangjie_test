// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign class A{
	static var a : Int32
}

unsafe func main() {
  if(B.b() == 5){
    return 0;
  }
  return 1;
}

class B{
  static func b(){
    return A.a
  }
}
