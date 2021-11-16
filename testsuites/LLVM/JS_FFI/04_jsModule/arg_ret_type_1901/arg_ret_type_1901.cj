// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) | B(String) 
}

@JsModule["./momentModule"]
foreign func isMoment(arg: MyEnum) : String

unsafe func main() {
  var a = isMoment(B("hi"))
  var b = isMoment(A(111))
  if( a == "hi" && b == "Number"){
    return 0
  }
  return 1
}
