// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

interface R{
  /*static*/ func a(a:Int32){
    c = 10 + a
  }
}

class C <: R{
	var b = {a: Int32 => }
	C(){
	  b = a
	}
}

func main(): Int64{
  var d = C().b
	d(3)
	return Int64(c - 13)
}