// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["Int64"]
foreign func cjKeyword03(arg: String) : String

unsafe func main() {
  if(cjKeyword03("group2")=="hhh"){
    return 0;
  }
  return 1;
}

