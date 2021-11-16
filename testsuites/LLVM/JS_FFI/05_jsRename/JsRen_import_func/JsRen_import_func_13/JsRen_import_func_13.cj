// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func func13(arg: Bool) : Bool

unsafe func main() {
  if(A.a()(true)){
    return 0;
  }
  return 1;
}

class A{
  static func a(){
    return func13
  }
}
