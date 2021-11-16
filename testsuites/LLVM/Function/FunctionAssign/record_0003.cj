// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

record R{
  func a(){
    c = 10
  }
  func a1(){
    c = 11
  }
  func a2(){
    c = 12
  }
  func a3(){
    c = 13
  }
}

var b = R().a


func main(): Int64{
  b = R().a1
  b = R().a2
  b = R().a3
	b()
	return Int64(c - 13)
}