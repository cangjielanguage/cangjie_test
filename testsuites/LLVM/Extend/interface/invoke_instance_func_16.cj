// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
  func foo(){
    return "a"
  }
}

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    return b
  }
}

extend A <: I{
  public func me(a!: String = foo()) {
    
  }
}

func main(): Int64 {
	if(A().me() == ()){
	  return 0
	}
  return 2
}