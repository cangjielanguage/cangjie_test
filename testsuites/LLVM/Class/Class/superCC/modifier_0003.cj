// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

external open class C1 {
  open func f() {
    a = 3
  } 
}

class C2 <: C1 {
  override func f() {
    super.f()
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
