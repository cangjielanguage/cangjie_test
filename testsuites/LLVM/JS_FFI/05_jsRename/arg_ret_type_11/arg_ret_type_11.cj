// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType11(arg: Float32) : Float32

unsafe func main() {
  if(argRetType11(3.001) == 8.001){
    return 0;
  }
  return 1;
}
