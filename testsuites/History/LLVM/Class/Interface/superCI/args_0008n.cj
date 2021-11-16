// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1{
  func f(a: Int64) {
    a = 3
  } 
}

class C2 <: I1{
  override func f(a: Int64) {
    super<I1>.f() //EXPECTED: regex no matching function declaration for function call 'f'
  } 
}


func main(): Int64 {
		C2().f(0)
    return (a - 3)
}
