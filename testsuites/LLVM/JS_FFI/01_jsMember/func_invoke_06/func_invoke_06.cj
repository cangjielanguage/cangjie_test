// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
foreign func moment1() : Moment

open class B{
  static func sa() : ()->Moment{
    return moment1
  }

  static func bs() : Moment{
    return moment1()
  }

  func a() : ()->Moment{
    return moment1
  }

  func b() : Moment{
    return moment1()
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
