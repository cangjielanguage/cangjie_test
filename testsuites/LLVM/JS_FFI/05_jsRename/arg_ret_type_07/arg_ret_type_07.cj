// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType07(arg: UInt32) : UInt32

unsafe func main() {
  if(argRetType07(3) == 8){
    return 0;
  }
  return 1;
}
