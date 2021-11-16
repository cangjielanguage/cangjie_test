// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1 {
  static func f() {
    a = 3
  } 
}

class C2 <: I1 {
  override func f() {
    super<I1>.f() //EXPECTED: regex object cannot access static member 'f'
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
