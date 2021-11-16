// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign interface A{
	static func isMoment(arg: Int16) : Int16
}

class B <: A{
  static func isMoment(arg: Int16) : Int16{
    return arg
  }
}

unsafe func main() {
  if(a()==3){
    return 0;
  }
  return 1;
}

func a(para!:Int16 = B.isMoment(3)): Int16{
  return para
}