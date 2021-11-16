// DEPENDENCE: ../../driver_module_01
// EXEC: %compiler -module driver_module_01/ -v -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex Cangjie Compiler.*?\(.*?\d{4}-\d{2}-\d{2}\)
// EXEC: %ls aoo.o
// EXEC: %run %run_opt main

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
