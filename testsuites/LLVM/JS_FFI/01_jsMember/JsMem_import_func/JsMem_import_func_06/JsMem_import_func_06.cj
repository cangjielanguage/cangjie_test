// DEPENDENCE:momentMember.js
// DEPENDENCE: a importcfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.%suffix
// EXEC: %copycharjs ./a/
// EXEC: %compiler %cmp_opt %n.cj -import-config importcfg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import a.*

unsafe func main() {
  if(a()==6){
    return 0;
  }
  return 1;
}

func a(): UInt32{
  return A.isMoment(6)
}
