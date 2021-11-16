// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1a {
  func f() {
    a = 3
  } 
}

interface I1b {
  func f() {
    a = 4
  } 
}

interface I1c {
  func f() {
    a = 5
  } 
}


interface I2  <: I1a & I1b & I1c{
  func f() {
    super<I1c>.f()
  } 
}

class Data <: I2{
	
}


func main(): Int64 {
		Data().f()
    return (a - 5)
}
