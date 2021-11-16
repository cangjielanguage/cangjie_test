// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

interface I{
  prop let a: Int64
  // func aaaa(): Int64
}

record RR <: I{
	var aa: Int64 = 3
	prop let a: Int64{
	  get(){
	    return aa
	  }
	}

	/*func aaaa(): Int64{
	 return aa
	}*/
}

record R {
  var a: I = RR()
  mut public func c(b : RR) {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(RR(aa: 98))
  return b.a.a - 98
}