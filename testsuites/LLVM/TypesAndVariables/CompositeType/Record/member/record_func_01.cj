// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test {
let a: Int32 = 0
var b: Int32 = 0
func foo(): Int32 {
a = a + 1 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
return a
}
}

let res = Test(2, 2).foo()

func run(): Int64 {
if (res == 3) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}

