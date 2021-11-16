// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
@JsRename["isMoment"]
foreign func funcBody02(a:String, b:String, c: String) : String

unsafe func main() {
  if(funcBody02("Lily", "Allen", "22")=="Lily Allen" ){
    return 0;
  }
  print(funcBody02("Lily", "Allen", "22"))
  return 0;
}
