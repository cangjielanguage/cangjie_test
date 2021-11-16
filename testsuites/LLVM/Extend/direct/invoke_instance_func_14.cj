// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
  A(let b!:Int64 = 0){

  }
}

extend A{
  public func me(a!: Int64 = b) {
    
  }
}

func main(): Int64 {
	if(A().me() == ()){
	  return 0
	}
  return 2
}
