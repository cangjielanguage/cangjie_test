// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign class B{
	static let a : Unit
}

unsafe func main() {
  if(a()==()){
    return 0;
  }
  return 1;
}

func a(): Unit{
  return B.a
}