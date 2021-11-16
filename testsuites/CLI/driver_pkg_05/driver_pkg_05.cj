// DEPENDENCE: ./src ./cfg-ast
// EXEC: %compiler %cmp_opt -c -package -o ./ 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?expected package directory when compiling a package

import aoo.*

func main(): Int64 {
let a = aoo.one
let b = boo.two
let res = a + b
if (res != 3) {
return 1
}
return 0
}
