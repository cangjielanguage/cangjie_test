// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1 {
  override func f() { //EXPECTED: regex 'override' modifier is illegal for function declaration in interface body
    a = 3
  } 
}

class C2 <: I1 {
  override func f() { //EXPECTED: regex invalid 'override' modifier when implementing an abstract function
    super<I1>.f()
  } 
}

func main(): Int64 {
		C2().f()
    return (a - 3)
}
