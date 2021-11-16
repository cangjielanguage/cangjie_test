// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) 
}

@JsModule["./momentModule"]
foreign var a : MyEnum =A(19)

unsafe func main() {
  let value = match (a){
    case A(19) => 0
    case _ => 1
  }
  return value
}