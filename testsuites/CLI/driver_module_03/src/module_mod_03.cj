// DEPENDENCE: ../../driver_module_03
// EXEC: %compiler -module driver_module_03.cj -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?module path 'driver_module_03.cj' is invalid

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
