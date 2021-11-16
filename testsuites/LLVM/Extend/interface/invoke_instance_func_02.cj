// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
	func foo(){
	  return 1
	}
}


class A{
	A(var a! : Int64 = 5){

	}
}
 
extend A <: I{
  public func me() {
    return ppp() + foo()
  }

  func ppp(){
    return this.a
  }
}


func main(): Int64 {
  return A().me() - 6
}
