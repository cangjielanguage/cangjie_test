// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

unsafe func main() {
  if(isMoment(3) == 3){
    return 0;
  }
  return 1;
}

foreign {
  @JsModule["./momentModule"]
	func isMoment(arg: Int64) : Int64
}