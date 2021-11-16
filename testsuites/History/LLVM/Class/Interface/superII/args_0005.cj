// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 'c'

interface I1 <T>{
  func f(b!: Char) {
    a = b
  } 
}

interface I2 <T> <: I1<T>{
  func f(b!: Char) {
    super<I1<T>>.f(b: b)
  } 
}

class Data<T> <: I2<T>{
	
}


func main(): Int64 {
		Data<Char>().f(b: 'a')
    if( a == 'a'){
      return 0
    }
    return 2
}
