// DEPENDENCE: ../../module_mod_05n
// EXEC: %compiler %cmp_opt %mod_opt %n -o ./ 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex package 'pro1/xoo' is not found
// ASSERT: regex package 'pro1/yoo' is not found
// ASSERT: regex package 'pro2/zoo' is not found


import aoo.*
import boo.*
from pro1 import xoo.*
from pro1 import yoo.*
from pro2 import zoo.*

func main(): Int64 {
let a = aoo.one
let b = boo.two
let e = xoo.x
let f = yoo.y
let g = zoo.z
let res = a + b
let res2 = e + f + g
if (res != 3 || res2 != 75) {
return 1
}
return 0
}
