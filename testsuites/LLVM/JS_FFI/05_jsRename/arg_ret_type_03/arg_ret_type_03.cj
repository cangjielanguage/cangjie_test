// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType03(arg: Int32) : Int32

unsafe func main() {
  if(argRetType03(3) == 8){
    return 0;
  }
  return 1;
}
