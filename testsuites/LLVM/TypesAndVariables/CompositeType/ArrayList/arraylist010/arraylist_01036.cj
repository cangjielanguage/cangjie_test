// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var l : Int64 = 10
func x(input:Int64):Int64{input}
var a : ArrayList<Int64> = ArrayList<Int64>(l,x)

a.set(Int32(1),1) // EXPECTED: regex no matching function declaration for function call

return 1
}
