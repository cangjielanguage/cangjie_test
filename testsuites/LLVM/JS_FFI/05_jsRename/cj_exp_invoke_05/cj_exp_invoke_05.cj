// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke05(arg: UInt64) : UInt64

unsafe func main() {
  if({=>cjExpInvoke05}()(3)== 8){
    return 0;
  }
  return 1;
}
