// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

func main() {
  var b = R(a: 6)
  b.c(7)
  return Int64(b.a - 8)
}

record R{
  var a : Int32 = 8
  let ccc = cc

  mut public func c(b : Int32) : Int32{
    a = ccc() + b
	  return a
	}
}

func cc(): Int32{
  return 1
}