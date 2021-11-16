// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgsa/pkgsa.cj src/pkgsa/pkgsb.cj -o pkgsa.%middle && %copycharjs src/pkgsa
// EXEC: %compiler %cmp_opt %f  pkgsa.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgsa.*

func main(): Int64 {
    let a = pkgsa.one
    let b = pkgsa.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
