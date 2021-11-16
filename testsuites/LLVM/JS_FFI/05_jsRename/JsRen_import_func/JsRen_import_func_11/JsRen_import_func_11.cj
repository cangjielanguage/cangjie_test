// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign interface C{
	static func isMoment(arg: Float64) : Float64
}

class B <: C{
  static func isMoment(arg: Float64) : Float64{
    return arg
  }
}

unsafe func main() {
  if(a()==3.00001){
    return 0;
  }
  return 1;
}

func a(para!:Float64 = B.isMoment(3.00001)): Float64{
  return para
}