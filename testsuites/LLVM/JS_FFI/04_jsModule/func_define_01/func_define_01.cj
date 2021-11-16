// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsModule["./momentModule"]
foreign class A{
	static func isMoment(arg: (Float16)->Float16) : (Float16)->Float16	
}


unsafe func main() {
  var b = A.isMoment(a)
  if(b(2.0) == 8.0 && A.isMoment(b)(2.0) == 8.0){
    return 0;
  }
  return 1;
}

func a(a: Float16): Float16{
  return a*a*a
}