// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 <T>{
  func f(): Bool {
    a = 3
    return true
  } 
}

interface I2 <T> <: I1<T>{
  func f(): Bool {
    super<I1<T>>.f()
  } 
}

class Data<T> <: I2<T>{
	
}


func main(): Int64 {
		if( Data<Bool>().f()){
		  return (a - 3)
		} else {
		  return 2
		}
    
}
