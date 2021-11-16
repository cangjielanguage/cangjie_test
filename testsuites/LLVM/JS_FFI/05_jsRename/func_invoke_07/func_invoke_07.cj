// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcInvoke07() : Moment

record A{
  static func sa() : ()->Moment{
    return funcInvoke07
  }

  static func bs() : Moment{
    return funcInvoke07()
  }

  func a() : ()->Moment{
    return funcInvoke07
  }

  func b() : Moment{
    return funcInvoke07()
  }
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
