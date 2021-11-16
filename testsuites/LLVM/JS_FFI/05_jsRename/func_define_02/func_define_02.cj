// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["isMoment"]
@JsMember["./momentMember"]
foreign class A{
	func funcDefine02(arg: Int64) : Int64
}

unsafe func main() {
  if(A().funcDefine02(3) == 8){
    return 0;
  }
  return 1;
}
