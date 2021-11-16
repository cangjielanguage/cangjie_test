// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A<X,Y>{
init(a:X){print("A_first")}
init(a:Y){print("A_second")}
}

record B<X,Y>{
init(a:X){print("B_first")}
init(a:Y){print("B_second")}
}

func main():Int64{
var i = A<Int16,Int32>(1) // EXPECTED: regex ambiguous match for constructor call
var j = B<Int16,Int32>(1) // EXPECTED: regex ambiguous match for constructor call
return 0
}
