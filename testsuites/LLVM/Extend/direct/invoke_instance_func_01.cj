// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}

extend A {
  public func me() {
    a = 0
    return this.a
  }
}

func main(): Int64 {
  return A().me()
}