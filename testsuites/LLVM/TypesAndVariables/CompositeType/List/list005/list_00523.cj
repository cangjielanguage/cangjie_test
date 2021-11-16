// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}

class Child <: Father{}

func test(): Int64 {
var a = List<Child>([Father()].toArray()) // EXPECTED: regex no matching constructor for call
return a.size() - 1
}

func main(): Int64 {
return test()
}
