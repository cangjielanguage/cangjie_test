// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

open class C1 {
  static func f() {
    a = 3
  } 
}

class C2 <: C1 {
  override func f() {
    super.f() //EXPECTED: regex object cannot access static member 'f'
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
