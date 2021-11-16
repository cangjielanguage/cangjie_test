// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
	func foo(){
	  return 1
	}
}

class A{
  A(var b!:Int32 = 0){

  }
}

extend A <: I{
  public func me(b:Int32): This {
    foo()
    return this
  }
}

func main(): Int64 {
  return Int64(A().me(3).b)
}