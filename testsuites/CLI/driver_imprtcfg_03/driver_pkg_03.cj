// DEPENDENCE: ./src ./importcfg src/aoo
// EXEC: %compiler %cmp_opt -c -package aoo -o aoo
// EXEC: %compiler %f -import-config   2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-auto this Option needs a value: '-import-config' 

import aoo.*

func main(): Int64 {
let a: Int32 = aoo.one
let b: Int32 = 2
let res = a + b
if (res != 3) {
return 1
}
return 0
}
