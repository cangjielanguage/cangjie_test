// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var a = 0

interface I1 <T>{
  func f(b: Bool) {
    a = 3
  } 
}

interface I2 <: I1<Bool>{
  override func f(b: Bool) {
    super<I1<Char>>.f(b) //EXPECTED: regex generics type arguments do not match the constraint
  } 
}

class Data<T> <: I2{
	
}


func main(): Int64 {
		Data<Char>().f(true)
    return (a - 3)
}
