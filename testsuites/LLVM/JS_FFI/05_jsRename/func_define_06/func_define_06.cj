// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcDefine06(a: T) : T

unsafe func main() {
  if(funcDefine06(6) == 6){
    return 0;
  }
  return 1;
}

type T = Int64
