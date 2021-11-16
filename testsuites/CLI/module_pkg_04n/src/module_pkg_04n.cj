// DEPENDENCE: ../../module_pkg_04n ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt %n/src/aoo/ %n/src/boo -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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
