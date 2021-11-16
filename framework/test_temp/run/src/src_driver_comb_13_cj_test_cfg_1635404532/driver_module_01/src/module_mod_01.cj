// DEPENDENCE: ../../driver_module_01
// EXEC: %compiler %cmp_opt %mod_opt ./driver_module_01 -o ./
// EXEC: %run %run_opt %main %run_args

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
