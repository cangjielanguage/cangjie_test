// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

external interface I1 {
  func f() {
    a = 3
  } 
}

interface I2 <: I1 {
  func f() {
    super<I1>.f()
  } 
}

class Data <: I2{
	
}


func main(): Int64 {
		Data().f()
    return (a - 3)
}
