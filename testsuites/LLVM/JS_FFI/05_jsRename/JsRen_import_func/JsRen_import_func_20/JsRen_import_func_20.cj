// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface B{}
class A <:B{}

unsafe func main() {
  return 0;
}

class C{
  func a(){
    return func20(A())
  }
}

foreign {
  @JsRename["isMoment"]
  @JsMember["./momentMember"]
	func func20(arg: A) : B
}