// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Bool = true
  mut public func c(b : Bool): Bool {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(false)
  if(b.a){
    return 1
  }
  return 0
}