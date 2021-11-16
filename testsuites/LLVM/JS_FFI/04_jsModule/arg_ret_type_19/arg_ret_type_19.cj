// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A | B
}

@JsModule["./momentModule"]
foreign func isMoment(arg: MyEnum) : MyEnum

func main() {
  var a = isMoment(B)
  var b = match(a){
    case $A => 0
    case $B => 1
    case _ => 2
  }
  return b-1
}
