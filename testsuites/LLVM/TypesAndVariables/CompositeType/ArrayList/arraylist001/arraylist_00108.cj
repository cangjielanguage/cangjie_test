// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
func x(a:Int64):Int64{a}
var myArray : ArrayList<Int64> = ArrayList<Int64>(Int32(5),x) // EXPECTED: regex no matching constructor for call
return 0
}
