// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo1(x: Int32): Int8 {
var i: Int8 = 3
var i1: Int32 = 2
if (x > 3) {
return i + 1
} else {
return i1 + 1  // EXPECTED: regex-auto invalid binary operator '+' on type 'Int32' and 'Int8'
}
}


func main(): Int64 {
var res1: Int8 = foo1(4)
return 0
}
