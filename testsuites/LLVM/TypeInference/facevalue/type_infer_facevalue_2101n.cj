// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo1(x: Int32): Int8 {
var i: Int8 = 3
if (x > 3:) { // EXPECTED: regex expected expression here
return i + 1
} else {
return 3 - 1
}
}

func main(): Int64 {
var res1: Int8 = foo1(4)
var res2: Int8 = foo1(2)

if (res1 != 4 || res2 != 2) {
return 1
}
return 0
}
