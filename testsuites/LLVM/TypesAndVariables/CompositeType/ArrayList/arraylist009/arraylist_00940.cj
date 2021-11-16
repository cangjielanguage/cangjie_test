// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a : Int64 = 10
func x(input:Int64):Int64{100}
var b : ArrayList<Int64> = ArrayList<Int64>(a,x)

b.add(Int32(8),1000) // EXPECTED: regex no matching function declaration for function call

return 1
}
