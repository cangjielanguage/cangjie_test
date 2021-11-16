// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}

class Child <: Father{
var c : Int64 = 0
}

func main(): Int64 {
var a : Int64 = 10
func x(input:Int64):Father{Father()}
var b : ArrayList<Father> = ArrayList<Father>(a,x)
func f(input:Child):Unit{
print(input.c.toString())
}
b.forEach(f) // EXPECTED: regex no matching function declaration for function call
return 0
}
