// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
interface I{
	func foo(){
	  return 1
	}
}

class A{
  A(let b!:Int32 = 0){

  }
}

extend A <: I {
  public func me(a:Int32) {
    b = foo() //EXPECTED: regex cannot assign to value which is an initialized 'let' constant

  }
}

func main(): Int64 {
  return 0
}