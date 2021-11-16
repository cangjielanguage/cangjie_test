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
    return func12
  }
}

foreign {
  @JsRename["isMoment"]
  @JsMember["./momentMember"]
	func func12(arg: Char) : Char
}