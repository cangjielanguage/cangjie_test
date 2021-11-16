// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var l : Int64 = 10
func x(input:Int64):Int64{input}
func y(input:Int64):Int32{Int32(input)}
var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
var b : ArrayList<Int32> = ArrayList<Int32>(l,y)

a.addAll(0,b) // EXPECTED: regex no matching function declaration for function call

return 0
}
