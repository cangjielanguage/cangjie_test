// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

var a = 0

open class C1 <T>{
  open func f(b: Bool) {
    a = 3
  } 
}

class C2 <: C1<Bool>{
  override func f(b: Bool) {
    super.f(b)
  } 
}

func main(): Int64 {
		C2<Char>().f(true) //EXPECTED: regex type argument's number does not match type parameter's number
    return (a - 3)
}
