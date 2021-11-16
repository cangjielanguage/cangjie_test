// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsRename["a"]
  @JsMember["./momentMember"]
  var c : Int16
}

unsafe func main() {
  if(b()==3){
    return 0;
  }
  return 1;
}

func b(para!:Int16 = c): Int16{
  return para
}