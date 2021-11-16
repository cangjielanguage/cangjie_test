// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

open class B{
	var c = 0

	func bbb(){

	}
}

class A <: B{
  A(let b!:Int32 = 0){

  }
}

interface I{
  func foo(){
    return 1
  }
}

extend A <: I{
  public func me() {
    super.c  //EXPECTED: regex 'super' is not allowed inside an extend declaration
    super.bbb()  //EXPECTED: regex 'super' is not allowed inside an extend declaration
    super.foo()  //EXPECTED: regex 'super' is not allowed inside an extend declaration
  }
}

func main(): Int64 {
  return 0
}