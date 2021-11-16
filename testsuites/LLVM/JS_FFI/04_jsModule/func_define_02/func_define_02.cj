// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign class A{
	func isMoment(arg: Int64) : Int64
}

unsafe func main() {
  if(A().isMoment(3) == 8){
    return 0;
  }
  return 1;
}
