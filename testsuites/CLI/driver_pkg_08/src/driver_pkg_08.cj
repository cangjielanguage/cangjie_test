// DEPENDENCE: ../cfg-ast ../cfg-astb aoo
// EXEC: %compiler %cmp_opt -c -package aoo/boo/ -o ./
// EXEC: %compiler %cmp_opt -c -package aoo/ -import-config cfg-astb boo.%middle -o ./
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast aoo.%middle boo.%middle -o %output
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

