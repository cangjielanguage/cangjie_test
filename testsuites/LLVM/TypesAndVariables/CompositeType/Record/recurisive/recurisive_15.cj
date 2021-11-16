// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record R{
	var a = 0
	var b = 2
}

class C{
  var a = 0
	var b = 2	
}

func main(): Int64{
  var a = R()
  var b = a
  a.a = 3

  var ac = C()
  var bc = ac
  ac.a = 3
  if(b.a == 0 && bc.a == 3){
    return 0
  }
	return 2
}