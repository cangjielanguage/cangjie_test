// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: Float32) : Float32

unsafe func main() {
  if(isMoment(3.001) == 8.001){
    return 0;
  }
  return 1;
}
