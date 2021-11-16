// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var result = 0

class A{
	
}

open class C1 {
  open func f() {
    result = result + 3
  }

  open func f(a: Int32) {
    result = result + 4
  } 

  open func f(b: Int64) {
    result = result + 5
  } 

  open func f(a: Bool) {
    result = result + 6
  } 

  open func f(a: Array<Bool>) {
    result = result + 7
  } 

  open func f(a: A) {
    result = result + 8
  } 
}

class C2  <: C1{
  override func f() {
    super.f()
    super.f(0)
    super.f(true)
    super.f(A())
  } 
}



func main(): Int64 {
		C2().f()
    return (result - 22)
}
