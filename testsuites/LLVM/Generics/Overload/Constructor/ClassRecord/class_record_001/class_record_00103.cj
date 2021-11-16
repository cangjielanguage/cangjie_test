// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A{
init(a:Int16){print("A_first")}
init(a:Int32){print("A_second")}
}

record B{
init(a:Int16){print("B_first")}
init(a:Int32){print("B_second")}
}

func main():Int64{
var i = A(1) // EXPECTED: regex ambiguous match for constructor call
var j = B(1) // EXPECTED: regex ambiguous match for constructor call
return 0
}
