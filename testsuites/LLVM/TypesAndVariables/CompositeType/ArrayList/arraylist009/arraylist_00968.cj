// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a : Int64 = 9223372036854775807 // MAX_INT64, 1 << 63 - 1
var b : ArrayList<Int64> = ArrayList<Int64>(a)
b.reserve() // EXPECTED: regex no matching function declaration for function call
return 0
}
