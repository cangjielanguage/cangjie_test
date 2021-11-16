// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class Father{}

class Child <: Father{}

func main(): Int64 {
var l : Int64 = 10
func x(input:Int64):Father{Father()}
var a : ArrayList<Father> = ArrayList<Father>(l,x)
func test(input:Child):Bool{
return true
}
a.removeIf() // EXPECTED: regex no matching function declaration for function call
return 0
}
