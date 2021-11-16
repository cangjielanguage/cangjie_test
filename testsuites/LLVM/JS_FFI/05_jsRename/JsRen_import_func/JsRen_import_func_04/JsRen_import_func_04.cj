// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

unsafe func main() {
  if(A().a()(4) == 4){
    return 0;
  }
  return 1;
}

class A{
  func a(){
    return func04
  }
}

foreign {
  @JsRename["isMoment"]
  @JsMember["./momentMember"]
	func func04(arg: UInt16) : UInt16
}