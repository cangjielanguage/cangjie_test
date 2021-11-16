// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType12(arg: Float16) : Float16

unsafe func main() {
  if(argRetType12(3.1) == 8.1){
    return 0;
  }
  return 1;
}
