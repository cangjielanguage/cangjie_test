// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

open class C1 {
  open func f(): Bool {
    a = 3
    return true
  } 
}

class C2  <: C1{
  override func f(): Bool {
    super.f()
  } 
}


func main(): Int64 {
		if( C2().f()){
		  return (a - 3)
		} else {
		  return 2
		}
    
}
