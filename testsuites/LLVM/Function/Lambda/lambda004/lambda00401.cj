// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var test : Int64 = 2
let lambda = { a: Int64 => test - a} // EXPECTED: regex-auto lambda captured a mutable variable directly, lambda cannot be assigned to a variable
return lambda(2)
}
