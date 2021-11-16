// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke04(arg: Int16) : Int16

open class A {
  open prop let v: Int16 {
    get() { return cjExpInvoke04(3) }
  }
}
class B <: A {
  override prop let v: Int16 {
    get() { return super.v + 1 }
  }
}

unsafe func main() {
  if(B().v == 9){
    return 0;
  }
  return 1;
}
