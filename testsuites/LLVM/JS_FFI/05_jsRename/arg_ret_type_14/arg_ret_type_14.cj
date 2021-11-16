// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType14(arg: Bool) : Bool

unsafe func main() {
  if(argRetType14(false)){
    return 0;
  }
  return 1;
}
