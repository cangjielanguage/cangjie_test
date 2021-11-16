// DEPENDENCE: ../../module_mod_01_cpm
// EXEC: cd %n && cpm clean
// EXEC: cd %n && cpm build

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
