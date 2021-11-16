// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

var b = R(a: 6)

func main() {
  a()
  return Int64(b.a - 10)
}

record R{
  var a : Int32 = 8
}

extend R {
	mut func c(b! : Int32 = 4) : Int32{
    a = a + b
    return 0
  }
}


func a(){
  b.c()
}