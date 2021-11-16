// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 <T>{
  func f(b: T) {
    a = 3
  } 
}

interface I2 <T> <: I1<T>{
  func f(b: T) {
    super<I1<T>>.f(b)
  } 
}

class Data<T> <: I2<T>{
	
}


func main(): Int64 {
    Data<Bool>().f(true)
    return (a - 3)
}
