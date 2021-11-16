// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 <T>{
  func f(b: T) : T{
    a = 3
    return b
  } 
}

interface I2 <T> <: I1<T>{
  func f(b: T) : T{
    super<I1<T>>.f(b)
    return b
  } 
}

class Data<T> <: I2<T>{
	
}


func main(): Int64 {
		Data<Bool>().f(true)
    return (a - 3)
}
