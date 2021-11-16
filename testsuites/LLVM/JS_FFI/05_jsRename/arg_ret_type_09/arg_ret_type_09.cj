// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType09(arg: UInt8) : UInt8

unsafe func main() {
  if(argRetType09(3) == 8){
    return 0;
  }
  return 1;
}
