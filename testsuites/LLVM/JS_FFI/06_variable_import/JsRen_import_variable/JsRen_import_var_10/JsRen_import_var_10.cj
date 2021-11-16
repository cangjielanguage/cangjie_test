// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["a"]
foreign let c : Float32

unsafe func main() {
  if(A().b() == 10.0){
    return 0;
  }
  return 1;
}

class A{
  func b(){
    return c
  }
}


