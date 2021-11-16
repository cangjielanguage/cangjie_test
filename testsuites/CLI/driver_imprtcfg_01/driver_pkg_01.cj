// DEPENDENCE: ./src ./importcfg
// EXEC: %compiler %cmp_opt -c -package src/aoo -o ./
// EXEC: %compiler %cmp_opt %f -import-config importcfg aoo.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import aoo.*

func main(): Int64 {
    let a = aoo.one
    let b: Int32 = 2
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
