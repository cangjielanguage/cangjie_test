// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

interface R{
  func a(){
    c = 10
  }
}

class C <: R{
	
}

let b = C().a

func main(): Int64{
	b()
	return Int64(c - 10)
}