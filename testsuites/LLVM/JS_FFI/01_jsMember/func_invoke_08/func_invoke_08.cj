// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
foreign func moment1() : Moment

record A{
  static func sa() : ()->Moment{
    return moment1
  }

  static func bs() : Moment{
    return moment1()
  }
}

extend A{
  func a() : ()->Moment{
    return moment1
  }

  unsafe func b() : Moment{
    return moment1()
  }
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
