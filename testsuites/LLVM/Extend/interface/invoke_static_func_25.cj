// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
	A(var a! : Int64 = 5){

	}
}

interface I{
  static func foo(){
    1
  }
}

extend A <: I{
  static func me() : Int64{
    func me(){
      return 2
    }
    return foo()
  }
}

func main(): Int64 {
  return A.me() - 1
}