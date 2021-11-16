// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func funcBody03(a:String, b:String, c: String) : String

unsafe func main() {
  if(funcBody03("Lily", "Allen", "22")=="Lily Allen" ){
    return 0;
  }
  return 1;
}
