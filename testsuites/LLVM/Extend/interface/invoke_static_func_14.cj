// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int64 = 0){

  }
}

extend A <: I{
  static public func me(a!: Int64 = b) { //EXPECTED: regex error
    
  }
}

interface I{
  static func foo(){
    
  }
}

func main(): Int64 {
	if(A.me() == ()){
	  return 0
	}
  return 2
}