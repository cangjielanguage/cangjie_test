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
  func a() : ()->Moment{
    return moment1
  }

  unsafe func b() : Moment{
    return moment1()
  }
}

unsafe func main() {
  var a = A()
  if(a.a()().fromNow() && a.b().fromNow()){
    return 0;
  }
  return 1;
}