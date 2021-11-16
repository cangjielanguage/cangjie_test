// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

open class C1 {
  open func f() {
    a = 3
  } 
}

open class C2 <: C1 {
  protected override func f() { //EXPECTED: regex do not weaken access privilege 'public' for function 'f' in 'C1'
    super.f()
  } 
}

func main(): Int64 {
		C2().f() //EXPECTED: regex no matching function declaration for function call 'f'
    return (a - 3)
}
