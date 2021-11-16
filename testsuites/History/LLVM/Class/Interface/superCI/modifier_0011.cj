// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1 {
  func f() {
    a = 3
  } 
}

abstract class C2 <: I1 {
  func f() {
    super<I1>.f()
  } 
}

class C3 <: C2{}

func main(): Int64 {
    C3().f()
    return (a - 3)
}
