// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke06() : Moment

open class B{
  static func sa() : ()->Moment{
    return funcInvoke06
  }

  static func bs() : Moment{
    return funcInvoke06()
  }

  func a() : ()->Moment{
    return funcInvoke06
  }

  func b() : Moment{
    return funcInvoke06()
  }
}

class A <: B{
  
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
