// DEPENDENCE: ../module_mod_0401n
// EXEC: %compiler %cmp_opt %mod_opt %n -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex can not found src dir under the modulepath of 'module_mod_0401n'

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
