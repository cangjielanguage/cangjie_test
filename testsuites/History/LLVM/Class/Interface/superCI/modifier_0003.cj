// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

external interface I1 {
  func f() {
    a = 3
  } 
}

class C2 <: I1 {
  func f() {
    super<I1>.f()
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
