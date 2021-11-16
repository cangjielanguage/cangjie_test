// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
foreign func moment1() : Moment

unsafe func main() {
  if(moment1().fromNow()){
    return 0;
  }
  return 1;
}
