// DEPENDENCE: ./src ./importcfg
// EXEC: %compiler %cmp_opt -c -package src/aoo -o ./
// EXEC: %compiler %f -import-config importcfg aoo.o -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import aoo.*

func main(): Int64 {
let a = aoo.one
let b: Int32 = 2
let res = a + b
if (res != 3) {
return 1
}
return 0
}
