// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

unsafe func main() {
  if(A().a()('a') == 'a'){
    return 0;
  }
  return 1;
}

class A{
  func a(){
    return isMoment
  }
}

foreign {
  @JsMember["./momentMember"]
	func isMoment(arg: Char) : Char
}