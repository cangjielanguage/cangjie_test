// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
func x(a:Int64):Int64{a}
var i : Int64 = 5
let a = ArrayList<Int64>(i,x)
let b = ArrayList<Int64>(i,x)
a = b // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
return 0
}
