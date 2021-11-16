// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign class B{
	static let a : UInt8
}

unsafe func main() {
  if(a()==2){
    return 0;
  }
  return 1;
}

func a(): UInt8{
  return B.a
}