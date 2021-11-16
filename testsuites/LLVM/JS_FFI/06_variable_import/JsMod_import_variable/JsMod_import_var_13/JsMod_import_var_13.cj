// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign var a : Bool

unsafe func main() {
  if(a){
    return 0;
  }
  return 1;
}
