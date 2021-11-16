// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface B{}
class A <:B{}

unsafe func main() {
  return 0;
}

class C{
  func a(){
    return isMoment(A())
  }
}

foreign {
  @JsMember["./momentMember"]
	func isMoment(arg: A) : B
}