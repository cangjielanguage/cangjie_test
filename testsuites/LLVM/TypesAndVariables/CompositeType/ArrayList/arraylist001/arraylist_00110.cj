// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
func x(a:Int32):Int64{Int64(a)}
var i : Int64 = 5
var myArray : ArrayList<Int64> = ArrayList<Int64>(i,x) // EXPECTED: regex no matching constructor for call
return 0
}
