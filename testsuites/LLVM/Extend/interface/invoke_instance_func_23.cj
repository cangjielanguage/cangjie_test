// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}

interface I{
  func foo(){
    return 1
  }
}

extend A <: I{
  public func me() {
    return 0
  }

  func me(a: Int32) {
    return a + Int32(foo())
  }

  func me(a: Int32, b:Int32) {
    return a+b+Int32(foo())
  }
}

func main(): Int64 {
  let a = A()
  return a.me() + Int64(a.me(1) + a.me(0, -1)) - 2
}