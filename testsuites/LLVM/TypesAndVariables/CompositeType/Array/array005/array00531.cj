// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{
  let b : Int64 = 1
}

class B <: A{
  let a : Array<Int64> = @{1,0}
  let c : Int64
  init() {
    c = a[super.b]
  }
}

func main(): Int64 {
    var c = B()
    return c.c
}
