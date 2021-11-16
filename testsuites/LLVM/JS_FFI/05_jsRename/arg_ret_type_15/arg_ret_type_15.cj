// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType15(arg: Unit) : Unit

unsafe func main() {
  if(argRetType15(()) == ()){
    return 0;
  }
  return 1;
}
