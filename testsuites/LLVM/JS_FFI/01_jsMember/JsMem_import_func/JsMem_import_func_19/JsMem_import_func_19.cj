// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) 
}

@JavaScript
@JsMember["./momentMember"]
foreign interface A{
	static func isMoment(arg: MyEnum) : Int64
}

class B <: A{
  static func isMoment(arg: MyEnum) : Int64{
    let value = match (arg){
      case A(19) => 11
      case A(20) => 0
      case _ => 1
    }
    return value
  }
}

unsafe func main() {
  if(B.isMoment(A(19))== 11){
    return 0;
  }
  return 1;
}
