// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsRename["a"]
  @JsMember["./momentMember"]
  var c : Float16 
}

unsafe func main() {
  if(b()==9.0){
    return 0;
  }
  return 1;
}

func b(para!:Float16 = c): Float16{
  return para
}