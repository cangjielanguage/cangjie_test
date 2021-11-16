// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) 
}

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign interface C{
	static func isMoment(arg: MyEnum) : MyEnum
}

class B <: C{
  static func isMoment(arg: MyEnum) : MyEnum{
    return arg
  }
}

unsafe func main() {
  if(a()== 11){
    return 0;
  }
  return 1;
}

func a(para!:MyEnum = B.isMoment(A(19))): Int64{
  let value = match (para){
    case A(19) => 11
    case A(20) => 0
    case _ => 1
  }
  return value
}