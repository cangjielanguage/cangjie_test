// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    
  }
}

extend A{
  public func me() {
    return aaa()
  }
}

func main(): Int64 {
	if(A().me() == ()){
	  return 0
	}
  return 2
}