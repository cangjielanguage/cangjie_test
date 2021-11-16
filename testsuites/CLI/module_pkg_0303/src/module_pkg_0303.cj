// DEPENDENCE: ../../module_pkg_0303 ../cfg-ast
// EXEC: %compiler %cmp_opt -c %pkg_opt %n/src/aoo/ %n/src/boo %n/src/coo %n/src/doo %n/src/eoo -o ./ 2>&1 | compare %f
// ASSERT: regex are in circular dependencies.

import aoo.*
import boo.*
import coo.*
import doo.*
import eoo.*

func main(): Int64 {
    let a = aoo.one
    let b = boo.two
    let res = a + b + eoo.flag
    print(res.toString())
    if (res != 8) {
        return 1
    }
    return 0
}
