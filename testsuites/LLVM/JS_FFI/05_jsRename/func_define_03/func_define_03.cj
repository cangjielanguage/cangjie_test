// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

unsafe func main() {
  if(funcDefine03(3) == 3){
    return 0;
  }
  return 1;
}

foreign {
  @JsMember["./momentMember"]
  @JsRename["isMoment"]	
	func funcDefine03(arg: Int64) : Int64
}
