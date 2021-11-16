// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsModule["./momentModule"]
foreign class A{
	static var a : List<Int32>
}

unsafe func main() {
  if(B.b()[0] == 1 && B.b()[1] == 2){
    return 0;
  }
  return 1;
}

class B{
  static func b(){
    return A.a
  }
}
