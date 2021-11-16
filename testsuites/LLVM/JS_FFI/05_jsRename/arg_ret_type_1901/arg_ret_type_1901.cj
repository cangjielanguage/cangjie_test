// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) | B(String) 
}

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType1901(arg: MyEnum) : String

unsafe func main() {
  var a = argRetType1901(B("hi"))
  var b = argRetType1901(A(111))
  print(a)
  print(b)
  if( a == "hi" && b == "Number"){
    return 0
  }
  return 1
}
