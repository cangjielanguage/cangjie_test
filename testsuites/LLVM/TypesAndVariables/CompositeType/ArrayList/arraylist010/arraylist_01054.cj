// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var l : Int64 = 10
func x(input:Int64):Int64{input}
var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
func test(input:Int32):Bool{
if (input % 2 == 0) {
return true
}
return false
}
a.removeIf(test) // EXPECTED: regex no matching function declaration for function call
return 0
}
