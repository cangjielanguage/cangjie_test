// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

var a = moment1
let b = moment1

unsafe func main() {
  if(a().fromNow() && b().fromNow()){
    return 0;
  }
  return 1;
}
