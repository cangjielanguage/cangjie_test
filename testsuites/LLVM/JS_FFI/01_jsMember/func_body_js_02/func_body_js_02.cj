// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign func isMoment(a:String, b:String, c: String) : String

unsafe func main() {
  if(isMoment("Lily", "Allen", "22")=="Lily Allen" ){
    return 0;
  }
  print(isMoment("Lily", "Allen", "22"))
  return 0;
}