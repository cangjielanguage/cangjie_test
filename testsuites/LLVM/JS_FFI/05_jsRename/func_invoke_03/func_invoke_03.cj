// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcInvoke03() : Moment

class A{
  static var a = funcInvoke03
  static let b = funcInvoke03()
}

unsafe func main() {
  if(A.a().fromNow() && A.b.fromNow()){
    return 0;
  }
  return 1;
}
