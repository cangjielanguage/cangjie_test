// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
record R{
	R(var a : Int32){

	}
}

extend R <: I{
  static func me() { 
    return foo()
  }
}

interface I{
  static func foo(){
    1
  }
}


func main(): Int64 {
  if(R.me() == 1){
    return 0
  }
  return 2
}