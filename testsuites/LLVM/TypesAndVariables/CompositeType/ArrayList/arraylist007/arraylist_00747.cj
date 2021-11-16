// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a : Iterable<Int64> = Iterable<Int64>(1) // EXPECTED: regex interface 'Iterable' can not be instantiated
var b : ArrayList<Int64> = ArrayList<Int64>(a)
return b.size() - 1
}
