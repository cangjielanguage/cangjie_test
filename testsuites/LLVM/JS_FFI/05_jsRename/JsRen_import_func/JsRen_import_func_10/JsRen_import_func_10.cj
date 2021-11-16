// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JavaScript
@JsRename["A"]
@JsMember["./momentMember"]
foreign class B{
	static func isMoment(arg: Float32) : Float32
}

unsafe func main() {
  if(a()==7.001){
    return 0;
  }
  return 1;
}

func a(): Float32{
  return B.isMoment(2.001)
}