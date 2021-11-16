// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcDefine04() : Moment

unsafe func main() {
  if(funcDefine04().fromNow()){
    return 0;
  }
  return 1;
}
