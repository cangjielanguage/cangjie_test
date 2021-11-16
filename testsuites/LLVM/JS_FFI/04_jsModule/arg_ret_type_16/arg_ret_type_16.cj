// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: Int32*Bool) : Int32*Bool

unsafe func main() {
  var a = isMoment((3, true))
  if(a[0] == 3 && a[1]){
    return 0;
  }
  return 1;
}
