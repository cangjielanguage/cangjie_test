// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 <T>{
  func f(b: Bool) {
    a = 3
  } 
}

class C2 <: I1<Bool>{
  func f(b: Bool) {
    super<I1<Bool>>.f(b)
  } 
}

func main(): Int64 {
		C2().f(true)
    return (a - 3)
}
