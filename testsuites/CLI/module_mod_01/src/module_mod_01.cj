// DEPENDENCE: ../../module_mod_01 ../cfg-ast
// EXEC: %compiler %cmp_opt -c %pkg_opt %n/src/aoo/ %n/src/boo -o ./
// EXEC: %compiler %cmp_opt aoo.%middle boo.%middle -import-config cfg-ast  %f -o %output
// EXEC: %run %run_opt %output %run_args

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
