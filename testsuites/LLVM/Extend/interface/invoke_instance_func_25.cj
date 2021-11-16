// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
	A(var a! : Int64 = 5){

	}
}
interface I{
  func foo(){
    return 2
  }
}
extend A <: I{
  func me() : Int64{
    func me(){
      return 2
    }
    return foo() + me()
  }
}

func main(): Int64 {
  return A().me() - 4
}