// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

class A{
  static func a() : ()->Moment{
    return moment1
  }

  static func b() : Moment{
    return moment1()
  }
}

unsafe func main() {
  if(A.a()().fromNow() && A.b().fromNow()){
    return 0;
  }
  return 1;
}
