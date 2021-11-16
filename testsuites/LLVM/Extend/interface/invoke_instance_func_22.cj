// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}
interface I{
  func foo(){
    return "a"
  }
}
extend A <: I{
  func foo(){
    return "a"
  }

  public func me() {
    return 0
  }
}

func main(): Int64 {
  let aaa = A().me
  return aaa()
}