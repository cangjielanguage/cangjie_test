// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

open class C1{
  open func f(b: Int64) {
    a = 3
  } 
}

class C2 <: C1{
  override func f(b: Int64) {
    super.f() //EXPECTED: regex no matching function declaration for function call 'f'
  } 
}


func main(): Int64 {
		C2().f(0)
    return (a - 3)
}
