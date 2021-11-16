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
  var a = moment1
  let b = moment1()
}

unsafe func main() {
  var a = A()
  if(a.a().fromNow() && a.b.fromNow()){
    return 0;
  }
  return 1;
}
