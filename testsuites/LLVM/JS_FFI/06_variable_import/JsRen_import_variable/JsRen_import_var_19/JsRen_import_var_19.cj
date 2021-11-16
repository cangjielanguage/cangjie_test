// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum MyEnum{
	A(Int64) 
}

@JsMember["./momentMember"]
@JsRename["a"]
foreign var b : MyEnum =A(19)

unsafe func main() {
  let value = match (b){
    case A(19) => 0
    case _ => 1
  }
  return value
}