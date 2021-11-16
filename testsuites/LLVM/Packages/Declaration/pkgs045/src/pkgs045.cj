// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/pkgb/pkgc/pkgd/pkge/ -o ./
// EXEC: %compiler %cmp_opt %f  pkga.pkgb.pkgc.pkgd.pkge.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.pkgb.pkgc.pkgd.pkge.five

func main(): Int64 {
    let e = five
    let e2 = pkga.pkgb.pkgc.pkgd.pkge.five
    if (e != 5) {
        return 1
    }
    if (e2 != 5) {
        return 1
    }
    return 0
}
