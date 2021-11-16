// DEPENDENCE: ../pro1 ../pro2 ../src
// EXEC: %compiler %cmp_opt -c %pkg_opt pro1/src/xoo -o pro1
// EXEC: %compiler %cmp_opt -c %pkg_opt pro1/src/yoo -o pro1
// EXEC: %compiler %cmp_opt -c %pkg_opt pro2/src/zoo -o pro2
// EXEC: %compiler %cmp_opt -c %pkg_opt src/aoo/ src/boo -o ./
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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
