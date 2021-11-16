// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
class A<T>{
init(a:T){print("A_first")}
init(a:Int64){print("A_second")}
}

record B<T>{
init(a:T){print("B_first")}
init(a:Int64){print("B_second")}
}

func main():Int64{
var i = A<Int64>(1) // EXPECTED: regex ambiguous match for constructor call
var j = B<Int64>(1) // EXPECTED: regex ambiguous match for constructor call
return 0
}
