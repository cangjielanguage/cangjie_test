// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign class A{
	static let a : UInt64 
}

unsafe func main() {
  if(a()==8){
    return 0;
  }
  return 1;
}

func a(): UInt64{
  return A.a
}