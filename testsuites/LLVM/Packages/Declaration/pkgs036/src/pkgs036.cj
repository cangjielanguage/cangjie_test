// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*, pkgb.*

func main(): Int64 {
    let a = pkga.one
    let b = pkgb.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
