// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record R5 {
  static let other: R5 = R5()
  var a = 0
} 

func main(): Int64{
	return R5.other.a + R5().a
}