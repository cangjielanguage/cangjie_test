// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
foreign func funcInvoke12() : Moment

class A {
  var sa:()->Moment
  var bs:Moment
  init(){
    this.sa=funcInvoke12
    this.bs=funcInvoke12()
  }
}

unsafe func main() {
  if(A().sa().fromNow() && A().bs.fromNow()){
    return 0;
  }
  return 1;
}
