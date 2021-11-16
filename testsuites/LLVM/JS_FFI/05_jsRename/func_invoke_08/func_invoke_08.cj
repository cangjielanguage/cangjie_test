// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke08() : Moment

record A{
  static func sa() : ()->Moment{
    return funcInvoke08
  }

  static func bs() : Moment{
    return funcInvoke08()
  }
}

extend A{
  func a() : ()->Moment{
    return funcInvoke08
  }

  unsafe func b() : Moment{
    return funcInvoke08()
  }
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
