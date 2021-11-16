// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(a:UInt32,b:UInt16,c:UInt8) : UInt64

unsafe func main() {
  if(isMoment(5,3,0)==11 ){
    return 0;
  }
  return 1;
}