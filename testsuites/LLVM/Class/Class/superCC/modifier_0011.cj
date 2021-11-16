// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

open class C1 {
  open func f() {
    a = 3
  } 
}

abstract class C2 <: C1 {
  override func f() {
    super.f()
  } 
}

class C3 <: C2{}

func main(): Int64 {
    C3().f()
    return (a - 3)
}
