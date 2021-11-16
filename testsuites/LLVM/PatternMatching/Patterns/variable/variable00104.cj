// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var i : Int32 = 0
var res = match (i) {
case test =>
test = 1 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
test
}
if (res != 1) {
return 1
}
return 0
}

func main(): Int64 {
return test()
}
