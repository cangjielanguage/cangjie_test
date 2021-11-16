// DEPENDENCE: pkgb
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.*

func main(): Int64 {
    return 0
}
