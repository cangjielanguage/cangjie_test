// DEPENDENCE: ../driver_module_06
// EXEC: %compiler %cmp_opt -module driver_module_06 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?can not found src dir under the modulepath of 'driver_module_06'

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
