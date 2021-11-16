// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var a = 0

interface I1 <T>{
  func f(b: Bool) {
    a = 3
  } 
}

class C2 <:  I1<Bool>{
  override func f(b: Bool) {
    super<I1<Char>>.f(b) //EXPECTED: regex generics type arguments do not match the constraint
  } 
}

func main(): Int64 {
		C2<Char>().f(true) //EXPECTED: regex no matching function declaration for function call 'C2'
    return (a - 3)
}
