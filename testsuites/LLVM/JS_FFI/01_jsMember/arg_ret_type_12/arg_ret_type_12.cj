// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(arg: Float16) : Float16

unsafe func main() {
  if(isMoment(3.1) == 8.1){
    return 0;
  }
  return 1;
}
