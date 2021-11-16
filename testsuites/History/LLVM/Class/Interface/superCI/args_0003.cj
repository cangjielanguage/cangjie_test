// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 <T>{
  func f(b: T) : T{
    a = 3
    return b
  } 
}

class C2 <T> <: I1<T>{
  func f(b: T) : T{
    super<I1<T>>.f(b)
    return b
  } 
}


func main(): Int64 {
		C2<Bool>().f(true)
    return (a - 3)
}
