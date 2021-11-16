// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

 func pisum() : Float64 {
	var sum : Float64 = 0.0
	for (i in 0..500) {
		sum = 0.0
		var k = 1.0
		while(k <= 1000000.0) {
		  sum += 1.0 / (k*k)
		  k += 1.0
		}
	}
	return sum
}
func main() {
  var x = pisum()
  print("${x}")
  return 0
}