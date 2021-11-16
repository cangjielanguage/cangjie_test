// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsModule["./momentModule"]
  var a : String
}

unsafe func main() {
  if(b()=="fifteen"){
    return 0;
  }
  return 1;
}

func b(para!:String = a): String{
  return para
}