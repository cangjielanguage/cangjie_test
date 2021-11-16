// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo1(): Int8 {
return 2.0 // EXPECTED: regex type of return expression is incompatible with return type
}
func foo2(): Int64 {
return 2.2 // EXPECTED: regex type of return expression is incompatible with return type
}

func main(): Int64 {
var res1: Int8 = foo1()
var res2: Int64 = foo2()
return 0
}
