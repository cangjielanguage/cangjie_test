// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke02() : Moment

class A{
  var a = funcInvoke02
  let b = funcInvoke02()
}

unsafe func main() {
  var a = A()
  if(a.a().fromNow() && a.b.fromNow()){
    return 0;
  }
  return 1;
}
