// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkga/a.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/b.cj pkga.%middle -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt src/%n.cj pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.Coo
func main():Int64 {
    if ( Coo.foo() != 2 ) {
        return 1
    }
    return 0
}
