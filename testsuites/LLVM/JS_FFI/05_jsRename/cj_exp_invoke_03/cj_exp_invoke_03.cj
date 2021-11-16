// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke03(arg: Int32) : Int32

unsafe func main() {
  if(cjExpInvoke03(3) == 8){
    return Int64(cjExpInvoke03(3)-cjExpInvoke03(3));
  }
  return 1;
}
