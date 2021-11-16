// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var result = 0

class A{
  
}

open class C1 {
  open func f() {
    result = 3
  }

  open func f(a!: Int32 = 0) {
    result = 4
  } 

  open func f(b: Int64) {
    result = 5
  } 

  open func f(a: Bool) {
    result = 6
  } 

  open func f(a: Array<Bool>) {
    result = 7
  } 

  open func f(a: A) {
    result = 8
  } 
}

class C2  <: C1{
  override func f() {
    super.f() //EXPECTED: regex ambiguous match for function call 'f'
  } 
}

func main(): Int64 {
    C2().f()
    return (result - 6)
}
