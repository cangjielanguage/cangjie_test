// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
@JsRename["a"]
@JsMember["./momentMember"]
foreign var b : Int8

unsafe func main() {
  if(b==1){
    return 0;
  }
  return 1;
}
