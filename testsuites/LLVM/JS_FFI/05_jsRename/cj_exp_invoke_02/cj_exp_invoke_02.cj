// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke02(arg: Int64) : Int64

unsafe func main() {
  var a:Int64
  do{
    a = cjExpInvoke02(3) + 1
  }while(cjExpInvoke02(3)<8)

  if(a == 9){
    return 0;
  }
  return 1;
}
