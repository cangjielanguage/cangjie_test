// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func funcBody01(a:UInt32,b:UInt16,c:UInt8) : UInt64

unsafe func main() {
  if(funcBody01(5,3,0)==11 ){
    return 0;
  }
  return 1;
}
