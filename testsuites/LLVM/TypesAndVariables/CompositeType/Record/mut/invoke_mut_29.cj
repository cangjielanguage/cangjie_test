// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

type TypeMy = R
var b = TypeMy(a: 6)

func main() {
  a()
  return Int64(b.a - 10)
}

record R{
  var a : Int32 = 8
  mut func c(b : Int32) : Int32{
    a = a + b
    return 0
  }
}

func a(){
  b.c(4)
}