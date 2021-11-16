// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

record R{
  static func a(a:Int32){
    c = 10 + a
  }

  var b = a
  
}

func main(): Int64{
  var d = R().b
	d(3)
	return Int64(c - 13)
}