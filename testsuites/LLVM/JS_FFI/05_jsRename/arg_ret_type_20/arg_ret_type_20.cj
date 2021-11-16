// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType20(arg: (Float16)->Float16) : (Float16)->Float16

func a(a: Float16): Float16{
  return a*a*a
}

func main() {
  var b = argRetType20(a)
  if(b(2.0) == 8.0 && argRetType20(b)(2.0) == 8.0){
    return 0;
  }
  return 1;
}
