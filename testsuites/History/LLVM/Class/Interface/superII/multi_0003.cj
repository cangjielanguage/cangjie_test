// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1a<T>{
  func f() {
    a = 3
  } 
}

interface I1b<T>{
  func f() {
    a = 4
  } 
}

interface I2  <: I1a<Bool> & I1a<Char> & I1b<Char>{
  func f() {
    super<I1a<Bool>>.f()
  } 
}

class Data <: I2{
	
}


func main(): Int64 {
		Data().f()
    return (a - 3)
}
