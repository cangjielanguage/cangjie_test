// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke09() : Moment

interface A{
  static func sa() : ()->Moment

  static func bs() : Moment
}

class B <:A{
  static func sa() : ()->Moment{
    return funcInvoke09
  }

  static func bs() : Moment{
    return funcInvoke09()
  }
}

unsafe func main() {
  if(B.sa()().fromNow() && B.bs().fromNow()){
    return 0;
  }
  return 1;
}
