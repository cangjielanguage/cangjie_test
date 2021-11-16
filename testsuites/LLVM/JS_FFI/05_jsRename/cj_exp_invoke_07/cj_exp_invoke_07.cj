// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func cjExpInvoke07(arg: UInt32) : UInt32

var a:UInt32=0
var b:String=""

unsafe func main() {
  try {
    a=cjExpInvoke07(3)/2
  } catch (_) {
    b="catch an exception!"
    print(b)
  }
  print(b)
  if(a == 4){
    return 0;
  }
  return 1;
}
