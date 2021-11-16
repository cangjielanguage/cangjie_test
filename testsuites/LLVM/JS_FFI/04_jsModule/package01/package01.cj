// DEPENDENCE: momentModule.js
// DEPENDENCE: a importcfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.%suffix
// EXEC: %copycharjs ./a/
// EXEC: %compiler %cmp_opt %n.cj -import-config importcfg -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import a.*

@JsModule["./momentModule"]
foreign func moment1() : Moment

record A{
  static func sa() : ()->Moment{
    return moment1
  }

  static func bs() : Moment{
    return moment1()
  }

  func a() : ()->Moment{
    return moment1
  }

  func b() : Moment{
    return moment1()
  }
}

unsafe func main() {
  if(A.sa()().fromNow() && A.bs().fromNow() && A().a()().fromNow() && A().b().fromNow()){
    return 0;
  }
  return 1;
}
