// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsMember["./momentMember"]
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