// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

var b = R()

func main() {
  a()
  return Int64(b.a.a) - 4
}

record R{
  var a : RR = RR()
  mut func c(b : Int32) : Int32{
    a.c(b)
    return 0
  }
}

record RR{
  var a : Int32 = 8
  mut func c(b : Int32) : Int32{
    a = b
    return 0
  }
}

func a(){
  b.c(4)
}