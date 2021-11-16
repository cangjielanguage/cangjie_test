// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke11() : Moment

interface A<T>{
  static func sa() : ()->T

  static func bs() : T
}

class B <: A<Moment>{
  static func sa() : ()->Moment{
    return funcInvoke11
  }

  static func bs() : Moment{
    return funcInvoke11()
  }
}

unsafe func main() {
  if(B.sa()().fromNow() && B.bs().fromNow()){
    return 0;
  }
  return 1;
}
