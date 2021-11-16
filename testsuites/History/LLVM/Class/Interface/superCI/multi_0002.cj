// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1a{
  func f() {
    a = 3
  } 
}

interface I1b <: I1a {
  func f() {
    a = 4
    super<I1a>.f()
  } 
}

interface I1c <: I1a & I1b {
  func f() {
    a = 5
    super<I1b>.f()
  } 
}


class C2 <: I1a & I1b & I1c{
  func f() {
    super<I1c>.f()
  } 
}


func main(): Int64 {
		C2().f()
    return (a - 3)
}
