// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle  && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle  && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.*

func main(): Int64 {
    let c0: Int64 = 3
    let c: Int64 = pkgb.Data_b<Int64>(c0)
    if (c != 3) {
        return 1
    }
    return 0
}
