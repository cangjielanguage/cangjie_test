// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
@JsRename["isMoment"]
@JsMember["./momentMember"]
foreign func cjExpInvoke01(arg: Int8) : Int8

unsafe func main() {
  var a:Int8=cjExpInvoke01(3)

  while (a>1){
    if(a%3==0){
      break
    }
    a--
  }
  
  if(a == 6){
    return 0;
  }
  return 1;
}