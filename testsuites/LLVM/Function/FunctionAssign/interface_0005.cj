// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

interface R{
  func funca(a:Int32): Int32{
    c = 10 + a
    return 0
  }
}

class C <: R{
  var b : (Int32)->Int32
  init(){
    b = {a: Int32 => c = 10 + a; 0}
  }

  init(a: Int32){
    this()
    b = funca
  }
}

func main(): Int64{
  var d = C(3).b
	if( d(3) == 0) {
	  return Int64(c - 13)
	}
	return 1
	
}