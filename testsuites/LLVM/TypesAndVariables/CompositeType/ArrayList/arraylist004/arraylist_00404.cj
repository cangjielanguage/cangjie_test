// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
func x(input:Int64){return ()}
var a : ArrayList<Unit> = ArrayList<Unit>(10,x)
a.isEmpty(a) // EXPECTED: regex no matching function declaration for function call
return 1
}
