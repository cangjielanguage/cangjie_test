// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func moment1(a: T) : T

unsafe func main() {
  if(moment1(6) == 6){
    return 0;
  }
  return 1;
}

type T = Int64