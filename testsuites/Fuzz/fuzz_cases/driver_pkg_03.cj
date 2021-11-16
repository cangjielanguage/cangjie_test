// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not stack trace

import core dumped
import boo.*

func main(): Int64 {
let a = aoo.one
let b = boo.two
let res = a + b
if (res != 3) {
return 1
}
return 0
}