// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var result = 0

interface I1c {
  func f(): B {
    result = 3
    B()
  }
}

interface I1a {
  func f() : A{
    result = 4
    A()
  }
}

interface I1b {
  func f() :B{
    result = 5
    B()
  }

}

class C2 <: I1a & I1b & I1c{
  func f() : B{
    super<I1c>.f()
    B()
  } 
}

open class A{}
class B <: A{}


func main(): Int64 {
		C2().f()
    return (result - 3)
}
