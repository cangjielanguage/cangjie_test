// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
	func foo(){
	  return true
	}
}

extend Bool <: I{
	func foo(){
	  return true
	}

  func me() {
    return this.foo()
  }
}

func main(): Int64 {
  if(true.me() ){
    return 0
  }
  return 2
}