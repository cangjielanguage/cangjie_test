// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}

extend A <: I{
  static func me() { 
    return foo()
  }
}

interface I{
  static func foo(){
    5
  }
}


func main(): Int64 {
  if(A.me() == 5){
    return 0
  }
  return 2
}