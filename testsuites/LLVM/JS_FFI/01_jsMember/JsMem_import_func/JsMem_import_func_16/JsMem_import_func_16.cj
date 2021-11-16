// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
foreign{
  @JsMember["./momentMember"]
  func moment1(a: T) : T
}

unsafe func main() {
  if(moment1((1,2))[0] == 1 && moment1((1,2))[1] == 2){
    return 0;
  }
  return 1;
}

type T = Int64*Int32