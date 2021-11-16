// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let i: Int32 = 10
var lmda1 ={ x: Int32 =>
var test: Int32 = 10
test + x + i
}

func main(): Int64 {
var res1: Int64 = lmda1(3) // EXPECTED: regex initializer's type is incompatible with variable declaration 'res1'
if (res1 != 30) {
return 1
}
return 0
}
