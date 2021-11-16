// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: (Float16)->Float16) : (Float16)->Float16

func a(a: Float16): Float16{
  return a*a*a
}

unsafe func main() {
  var b = isMoment(a)
  if(b(2.0) == 8.0 && isMoment(b)(2.0) == 8.0){
    return 0;
  }
  return 1;
}
