// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

class R{
  static func funca(a:Int32): Int32{
    c = 10 + a
    return 0
  }

  var b : (Int32)->Int32 = {a: Int32 => 0}

  R(a: Int32){
    b = funca
  }
}

let d = R(3).b

func main(): Int64{
	d(0)
	return Int64(c - 10)
}