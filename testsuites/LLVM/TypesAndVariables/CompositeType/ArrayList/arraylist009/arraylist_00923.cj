// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}

class B{}

func main(): Int64 {
var a : Int64 = 10
func x(input:Int64):A{A()}
var b : ArrayList<A> = ArrayList<A>(a,x)

b.add(B()) // EXPECTED: regex no matching function declaration for function call

return b.size()-11
}
