// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}

extend A <:I{
  static public func me() {
    return foo()
  }
}

interface I{
  static func foo(){
    0
  }
}

func main(): Int64 {
  let aaa = A.me
  return aaa()
}