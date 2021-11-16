// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign class A{
	static func funcDefine01(arg: (Float16)->Float16) : (Float16)->Float16	
}


unsafe func main() {
  var b = A.funcDefine01(a)
  if(b(2.0) == 8.0 && A.funcDefine01(b)(2.0) == 8.0){
    return 0;
  }
  return 1;
}

func a(a: Float16): Float16{
  return a*a*a
}
