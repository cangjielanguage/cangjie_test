// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Char = 'a'
  mut public func c(b : Char): Char {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c('c')
  if(b.a == 'c'){
    return 0
  }
  return 1
}