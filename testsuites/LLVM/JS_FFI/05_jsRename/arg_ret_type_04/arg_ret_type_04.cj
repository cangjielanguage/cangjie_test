// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType04(arg: Int16) : Int16

unsafe func main() {
  if(argRetType04(3) == 8){
    return 0;
  }
  return 1;
}
