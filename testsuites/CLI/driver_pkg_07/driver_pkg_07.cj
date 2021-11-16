// DEPENDENCE: ./src/aoo
// EXEC: %compiler %cmp_opt -c -package aoo/boo -o ./

import aoo.boo.*

func main(): Int64 {
    let b = boo.two
    if (b != 2) {
        return 1
    }
    return 0
}
