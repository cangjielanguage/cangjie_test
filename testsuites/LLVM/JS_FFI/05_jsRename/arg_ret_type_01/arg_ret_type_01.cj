// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType01(arg: String) : String

unsafe func main() {
  if(argRetType01("group2")=="hhh"){
    return 0;
  }
  return 1;
}

