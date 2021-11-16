// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a : Int32 = 10
var b : ArrayList<Int64> = ArrayList<Int64>(a) // EXPECTED: regex no matching constructor for call
return b.size()
}
