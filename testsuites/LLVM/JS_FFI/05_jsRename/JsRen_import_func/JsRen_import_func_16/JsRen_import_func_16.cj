// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsRename["moment1"]
  @JsMember["./momentMember"]
  func func16(a: T) : T
}

unsafe func main() {
  if(func16((1,2))[0] == 1 && func16((1,2))[1] == 2){
    return 0;
  }
  return 1;
}

type T = Int64*Int32