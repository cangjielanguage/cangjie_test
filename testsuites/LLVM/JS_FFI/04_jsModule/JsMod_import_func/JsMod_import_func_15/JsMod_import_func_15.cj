// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsModule["./momentModule"]
foreign interface A{
	static func isMoment(arg: String) : String
}

class B <: A{
  static func isMoment(arg: String) : String{arg}
}

var a : (String)->String = B.isMoment

unsafe func main() {
  if(a("next")=="next"){
    return 0;
  }
  return 1;
}

