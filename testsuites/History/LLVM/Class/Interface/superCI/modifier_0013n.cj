// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1 {
  func f() {
    a = 3
  } 
}

open class C2 <: I1 {
  private override func f() { //EXPECTED: regex the method 'f' should be less restrictive than overridden function
    super<I1>.f()
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
