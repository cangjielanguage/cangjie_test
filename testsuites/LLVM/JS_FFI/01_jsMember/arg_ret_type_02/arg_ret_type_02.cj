// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(arg: Int64) : Int64

unsafe func main() {
  if(isMoment(3) == 8){
    return 0;
  }
  return 1;
}
