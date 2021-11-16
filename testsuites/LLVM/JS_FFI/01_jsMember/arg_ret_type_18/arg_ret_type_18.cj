// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

from collection import collection.*

@JsMember["./momentMember"]
foreign func isMoment(arg: Map<Int64, String>) : Map<Int64, String>

unsafe func main() {
  if(isMoment(Map<Int64, String>([(4,a)])) == Map<Int64, String>([(4,a)])){
    return 0;
  }
  return 1;
}
