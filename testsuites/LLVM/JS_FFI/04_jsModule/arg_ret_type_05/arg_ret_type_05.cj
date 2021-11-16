// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: Int8) : Int8

unsafe func main() {
  if(isMoment(3) == 8){
    return 0;
  }
  return 1;
}
