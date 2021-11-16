// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

from collection import collection.*

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType18(arg: HashMap<Int64, String>) : HashMap<Int64, String>

unsafe func main() {
  if(argRetType18(HashMap<Int64, String>([(4,a)])) == HashMap<Int64, String>([(4,a)])){
    return 0;
  }
  return 1;
}
