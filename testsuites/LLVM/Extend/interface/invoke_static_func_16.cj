// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }

}

interface I <: I{
  func foo(){
    
  }
}


extend A{
  static public func me(a!: Int32 = foo()) {//EXPECTED: regex error
    
  }
}

func main(): Int64 {
	if(A().me() == ()){
	  return 0
	}
  return 2
}