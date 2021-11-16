// DEPENDENCE: ./src ./cfg-ast
// EXEC: %compiler %cmp_opt -c -package src/aoo,src/boo -o ./ 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?invalid file or directory 'src/aoo,src/boo'

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
