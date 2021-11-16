// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 'c'

open class C1 {
  open func f(b!: Char) {
    a = b
  } 
}

class C2  <: C1{
  override func f(b!: Char) {
    super.f(b: b)
  } 
}

func main(): Int64 {
		C2().f(b: 'a')
    if( a == 'a'){
      return 0
    }
    return 2
}
