// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
	func foo(){
	  return 1
	}
}

class A{

}

extend A <: I{
  func me() { 
    return foo()
  }
}

func main(): Int64 {
  if(A().me() == 1){
    return 0
  }
  return 2
}