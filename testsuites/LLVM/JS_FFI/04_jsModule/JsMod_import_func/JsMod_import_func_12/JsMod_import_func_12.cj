// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

unsafe func main() {
  if(A().a()('a') == 'a'){
    return 0;
  }
  return 1;
}

class A{
  func a(){
    return isMoment
  }
}

foreign {
  @JsModule["./momentModule"]
	func isMoment(arg: Char) : Char
}