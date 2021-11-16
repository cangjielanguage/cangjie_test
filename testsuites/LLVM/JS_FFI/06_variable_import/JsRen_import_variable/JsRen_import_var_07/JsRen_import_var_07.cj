// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["a"]
foreign var b : Int64

unsafe func main() {
  if(b==1){
    return 0;
  }
  return 1;
}
