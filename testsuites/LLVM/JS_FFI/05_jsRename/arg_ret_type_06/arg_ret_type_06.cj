// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType06(arg: UInt64) : UInt64

unsafe func main() {
  if(argRetType06(3) == 8){
    return 0;
  }
  return 1;
}
