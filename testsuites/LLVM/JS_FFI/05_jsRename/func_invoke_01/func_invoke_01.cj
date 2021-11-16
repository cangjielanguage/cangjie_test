// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcInvoke01() : Moment

var a = funcInvoke01
let b = funcInvoke01

unsafe func main() {
  if(a().fromNow() && b().fromNow()){
    return 0;
  }
  return 1;
}
