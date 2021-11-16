// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

func main(): Int64 {
var a : Int64 = 10
func x(input:Int64):A{A()}
var b : ArrayList<A> = ArrayList<A>(a,x)

b.add(0) // EXPECTED: regex no matching function declaration for function call

return 1
}
