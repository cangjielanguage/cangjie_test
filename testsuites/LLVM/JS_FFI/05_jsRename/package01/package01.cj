// DEPENDENCE:  momentMember.js
// DEPENDENCE: a importcfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.%suffix
// EXEC: %copycharjs ./a/
// EXEC: %compiler %cmp_opt %n.cj -import-config importcfg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import a.*

@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func package01() : Moment

record A{
  static func sa() : ()->Moment{
    return package01
  }

  static func bs() : Moment{
    return package01()
  }

  func a() : ()->Moment{
    return package01
  }

  func b() : Moment{
    return package01()
  }
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
