// DEPENDENCE: ../../module_mod_05_cpm
// EXEC: cd %n &&  cpm clean
// EXEC: cd %n && cpm  build

import aoo.*
import boo.*
from "pro1" import xoo.*
from "pro1" import yoo.*
from "pro2" import zoo.*

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
