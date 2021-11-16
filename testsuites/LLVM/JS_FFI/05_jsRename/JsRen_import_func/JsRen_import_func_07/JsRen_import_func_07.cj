// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
@JsRename["A"]
foreign interface C{
	static func isMoment(arg: Int64) : Int64
}

class B <: C{
  static func isMoment(arg: Int64) : Int64{arg}
}

var a : (Int64)->Int64 = B.isMoment

unsafe func main() {
  if(a(7)==7){
    return 0;
  }
  return 1;
}

