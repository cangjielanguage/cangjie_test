// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: Unit) : Unit

unsafe func main() {
  if(isMoment(()) == ()){
    return 0;
  }
  return 1;
}
