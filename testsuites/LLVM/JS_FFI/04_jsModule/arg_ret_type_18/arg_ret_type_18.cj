// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

from collection import collection.*

@JsModule["./momentModule"]
foreign func isMoment(arg: HashMap<Int64, String>) : HashMap<Int64, String>

unsafe func main() {
  if(isMoment(HashMap<Int64, String>([(4,a)])) == HashMap<Int64, String>([(4,a)])){
    return 0;
  }
  return 1;
}

