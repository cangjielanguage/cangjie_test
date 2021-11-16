// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
	func foo(){
	  return 1
	}
}

extend Float16 <: I{
	func foo(){
	  return 1
	}

  func me() {
    return foo()
  }
}

func main(): Int64 {
  if(Float16(1).me() == 1){
    return 0
  }
  return 2
}