// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsRename["moment1"]
  @JsMember["./momentMember"]
  func func08(a: T) : T
}

unsafe func main() {
  if(func08(8) == 8){
    return 0;
  }
  return 1;
}

type T = UInt64