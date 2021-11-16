// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1{
  func f(a: Int64) {
    a = 3
  } 
}

interface I2 <: I1{
  override func f(a: Int64) {
    super<I1>.f() //EXPECTED: regex no matching function declaration for function call 'f'
  } 
}

class Data <: I2{
	
}


func main(): Int64 {
		Data().f(0)
    return (a - 3)
}
