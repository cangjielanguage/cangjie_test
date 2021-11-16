// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsRename["myclass"]
@JsMember["momentMember"]
foreign class B{
	static func a():String
}

unsafe func main() {
  if(B.a()=="hhh"){
    return 0;
  }
  return 1;
}