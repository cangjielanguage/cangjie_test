// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign class A{
	static func isMoment(arg: UInt8) : UInt8
}

unsafe func main() {
  if(a()==2){
    return 0;
  }
  return 1;
}

func a(): UInt8{
  return A.isMoment(2)
}