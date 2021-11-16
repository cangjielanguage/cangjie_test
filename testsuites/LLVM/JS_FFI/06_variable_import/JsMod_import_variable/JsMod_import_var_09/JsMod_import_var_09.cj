// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsModule["./momentModule"]
  var a : Float16 
}

unsafe func main() {
  if(b()==9.0){
    return 0;
  }
  return 1;
}

func b(para!:Float16 = a): Float16{
  return para
}