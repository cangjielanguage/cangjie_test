// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

open class C1 <T>{
  open func f(b: T) {
    a = 3
  } 
}

class C2 <T> <: C1<T>{
  override func f(b: T) {
    super.f(b)
  } 
}

func main(): Int64 {
    C2<Bool>().f(true)
    return (a - 3)
}
