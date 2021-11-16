// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

func main() {
  var b = R(a: 6)
  b.c(7)
  return Int64(b.a - 11)
}

record R{
  var a : Int32 = 8

  mut public func c(b : Int32) : Int32{
	  func cc(){
      4
    }
    a = Int32(cc()) + b
	  return a
	}
}

