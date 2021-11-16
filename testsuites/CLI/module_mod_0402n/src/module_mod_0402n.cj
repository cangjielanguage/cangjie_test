// DEPENDENCE: ../../module_mod_0402n
// EXEC: %compiler %cmp_opt %mod_opt %n -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex package name 'boo' not identical in one Package

import aoo.*
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
