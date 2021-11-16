// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign func isMoment(arg: List<Int64>) : List<Int64>

unsafe func main() {
  let a = isMoment([1])
  if(a == [1]){
    return 0;
  }
  return 1;
}
