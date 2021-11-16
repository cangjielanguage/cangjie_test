// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType10(arg: Float64) : Float64

unsafe func main() {
  if(argRetType10(3.00001) == 8.00001){
    return 0;
  }
  return 1;
}
