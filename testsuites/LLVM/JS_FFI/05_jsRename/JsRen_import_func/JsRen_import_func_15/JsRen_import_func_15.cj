// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign interface C{
	static func isMoment(arg: String) : String
}

class B <: C{
  static func isMoment(arg: String) : String{arg}
}

var a : (String)->String = B.isMoment

unsafe func main() {
  if(a("next")=="next"){
    return 0;
  }
  return 1;
}

