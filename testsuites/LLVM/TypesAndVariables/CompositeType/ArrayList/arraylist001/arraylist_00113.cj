// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
func x(a:Int64):Int64{a}
func y(a:Int64):Int32{Int32(a)}
var i : Int64 = 5
var a = ArrayList<Int64>(i,x)
var b = ArrayList<Int32>(i,y)
a = b // EXPECTED: regex type incompatible in this assignment
return 0
}
