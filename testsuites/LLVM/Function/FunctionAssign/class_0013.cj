// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

class R{
  func funca(a:Int32): Int32{
    c = 10 + a
    return 0
  }

  static var b : (Int32)->Int32 = {a: Int32 => 0}

  R(a: Int32){
    
  }
}


func main(): Int64{
  var d = R.b
  d(1)
  if(c == 0){
    R.b = R(2).funca
    d = R.b
    d(0)
  }
  
	return Int64(c - 10)
}