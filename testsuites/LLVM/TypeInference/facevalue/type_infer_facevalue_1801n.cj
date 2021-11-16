// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo1(x:Int8=1.0): Int8 { // EXPECTED: regex type of default argument value is not match to expected type 'Int8'
return x
}
func foo2(x:Int64=2.0): Int64 { // EXPECTED: regex type of default argument value is not match to expected type 'Int64'
return x
}

func main(): Int64 {
var res1: Int8 = foo1()
var res2: Int64 = foo2()
return 0
}
