// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsModule["./momentModule"]
foreign interface A{
	static func isMoment(arg: Int64) : Int64
}

class B <: A{
  static func isMoment(arg: Int64) : Int64{arg}
}

var a : (Int64)->Int64 = B.isMoment

unsafe func main() {
  if(a(7)==7){
    return 0;
  }
  return 1;
}

