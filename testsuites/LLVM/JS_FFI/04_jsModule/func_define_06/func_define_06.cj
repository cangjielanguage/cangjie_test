// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func moment1(a: T) : T

unsafe func main() {
  if(moment1(6) == 6){
    return 0;
  }
  return 1;
}

type T = Int64