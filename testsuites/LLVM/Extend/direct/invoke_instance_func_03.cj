// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}
 
extend A {
  private func ppp(){
    return this.a
  }

  public func me() {
    return ppp()
  }
}


func main(): Int64 {
  return A().me() - 5
}