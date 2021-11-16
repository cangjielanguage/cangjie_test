// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func argRetType13(arg: Char) : Char

unsafe func main() {
  if(argRetType13('a') == 'b'){
    return 0;
  }
  return 1;
}
