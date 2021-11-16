// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: Char) : Char

unsafe func main() {
  if(isMoment('a') == 'b'){
    return 0;
  }
  return 1;
}
