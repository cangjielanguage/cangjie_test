// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsModule["./momentModule"]
  func moment1(a: T) : T
}

unsafe func main() {
  if(moment1(8) == 8){
    return 0;
  }
  return 1;
}

type T = UInt64