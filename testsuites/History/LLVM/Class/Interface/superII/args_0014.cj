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

interface I2  <: I1a & I1b & I1c{
  func f() : B{
    super<I1c>.f()
    B()
  } 
}

open class A{}
class B <: A{}
class Data <: I2{
	
}


func main(): Int64 {
		Data().f()
    return (result - 3)
}
