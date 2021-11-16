// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsModule["./momentModule"]
foreign let a : Float32

unsafe func main() {
  if(A().b() == 10.0){
    return 0;
  }
  return 1;
}

class A{
  func b(){
    return a
  }
}


