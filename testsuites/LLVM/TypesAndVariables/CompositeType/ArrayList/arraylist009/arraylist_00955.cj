// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var a : Int64 = 10
func x(input:Int64):Int64{input}
var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
b.removeAt() // EXPECTED: regex no matching function declaration for function call
return b.get(5) - 6
}
