// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcInvoke05() : Moment

class A{
  static func a() : ()->Moment{
    return funcInvoke05
  }

  static func b() : Moment{
    return funcInvoke05()
  }
}

unsafe func main() {
  if(A.a()().fromNow() && A.b().fromNow()){
    return 0;
  }
  return 1;
}
