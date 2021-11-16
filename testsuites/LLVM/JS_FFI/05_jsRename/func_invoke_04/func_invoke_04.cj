// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke04() : Moment

class A{
  func a() : ()->Moment{
    return funcInvoke04
  }

  unsafe func b() : Moment{
    return funcInvoke04()
  }
}

unsafe func main() {
  var a = A()
  if(a.a()().fromNow() && a.b().fromNow()){
    return 0;
  }
  return 1;
}
