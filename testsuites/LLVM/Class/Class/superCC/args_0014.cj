// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var result = 0

open class C1a {
  open func f() : A{
    result = 4
    A()
  }
}


class C2 <: C1a{
  override func f() : B{
    super.f()
    B()
  } 
}

open class A{}
class B <: A{}


func main(): Int64 {
		C2().f()
    return (result - 4)
}
