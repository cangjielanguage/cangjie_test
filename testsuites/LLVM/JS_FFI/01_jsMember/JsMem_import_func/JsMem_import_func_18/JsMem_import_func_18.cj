// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign class A{
	static func isMoment(arg: (Float16)->Float16) : (Float16)->Float16
}

unsafe func main() {
  if(aa()(2.0)==8.0){
    return 0;
  }
  return 1;
}

func a(a: Float16): Float16{
  return a*a*a
}

func aa(): (Float16)->Float16{
  return A.isMoment(a)
}