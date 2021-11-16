// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(arg: Bool) : Bool

unsafe func main() {
  if(isMoment(false)){
    return 0;
  }
  return 1;
}
