// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType02(arg: Int64) : Int64

unsafe func main() {
  if(argRetType02(3) == 8){
    return 0;
  }
  return 1;
}
