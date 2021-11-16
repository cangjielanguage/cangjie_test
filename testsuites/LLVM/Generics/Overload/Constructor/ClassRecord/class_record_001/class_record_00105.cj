// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{
init(){print("A_first")}
init(a:Int64 = 1){print("A_second")}
}

record B{
init(){print("B_first")}
init(a:Int64 = 1){print("B_second")}
}

func main():Int64{
var i = A() // EXPECTED: regex ambiguous match for constructor call
var j = B() // EXPECTED: regex ambiguous match for constructor call
return 0
}
