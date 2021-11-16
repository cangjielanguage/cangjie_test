// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

open class C1 <T>{
  open func f(b: Bool) {
    a = 3
  } 
}

class C2 <: C1<Bool>{
  override func f(b: Bool) {
    super.f(b)
  } 
}

func main(): Int64 {
		C2().f(true)
    return (a - 3)
}
