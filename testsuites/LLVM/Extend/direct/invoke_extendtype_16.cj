// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
record R{
	R(var a : Int32){

	}
}

extend R {
  func me() { 
    return a
  }
}

func main(): Int64 {
  if(R(1).me() == 1){
    return 0
  }
  return 2
}