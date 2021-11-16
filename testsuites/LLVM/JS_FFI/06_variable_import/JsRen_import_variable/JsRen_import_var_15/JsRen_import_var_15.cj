// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsRename["a"]
  @JsMember["./momentMember"]
  var x : String
}

unsafe func main() {
  if(b()=="fifteen"){
    return 0;
  }
  return 1;
}

func b(para!:String = x): String{
  return para
}