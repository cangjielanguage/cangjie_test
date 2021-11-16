// EXEC: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface MyInterface{
let i : Int32 = 0
}

func main():Int64 {
MyInterface.i = 1 // EXPECTED: regex-auto cannot assign to value : 'Interface-MyInterface.i' is an initialized 'let' constant
return 1
}
