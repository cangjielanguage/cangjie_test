// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A | B
}

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType19(arg: MyEnum) : MyEnum

unsafe func main() {
  var a = argRetType19(B)
  var b = match(a){
    case $A => 0
    case $B => 1
    case _ => 2
  }
  return b-1
}
