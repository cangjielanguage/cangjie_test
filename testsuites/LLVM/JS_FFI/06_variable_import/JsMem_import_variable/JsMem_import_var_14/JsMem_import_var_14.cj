// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsMember["./momentMember"]
foreign class A{
	static let a : Unit
}

unsafe func main() {
  if(a()==()){
    return 0;
  }
  return 1;
}

func a(): Unit{
  return A.a
}