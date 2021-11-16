// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(arg: Float64) : Float64

unsafe func main() {
  if(isMoment(3.00001) == 8.00001){
    return 0;
  }
  return 1;
}
