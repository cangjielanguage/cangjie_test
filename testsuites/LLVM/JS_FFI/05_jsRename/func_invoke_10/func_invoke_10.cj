// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke10() : Moment

enum A {
  B | C
  static func bs(): Moment {
    return funcInvoke10()
  }
  static func sa(): ()->Moment {
    return funcInvoke10
  }
  
}


unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow()){
    return 0;
  }
  return 1;
}
