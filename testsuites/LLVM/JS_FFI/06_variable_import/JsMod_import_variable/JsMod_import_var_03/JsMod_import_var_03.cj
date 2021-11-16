// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsModule["./momentModule"]
  var a : Int16
}

unsafe func main() {
  if(b()==3){
    return 0;
  }
  return 1;
}

func b(para!:Int16 = a): Int16{
  return para
}