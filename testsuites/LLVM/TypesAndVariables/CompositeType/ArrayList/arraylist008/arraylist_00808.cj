// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}

class Child <: Father{}

func main(): Int64 {
var b : ArrayList<Father> = ArrayList<Father>(ArrayList<Child>()) // EXPECTED: regex no matching constructor for call
return 1
}
