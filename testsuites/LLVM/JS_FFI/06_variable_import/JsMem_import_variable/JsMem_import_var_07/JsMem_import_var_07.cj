// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsMember["./momentMember"]
foreign var a : Int64

unsafe func main() {
  if(a==1){
    return 0;
  }
  return 1;
}
