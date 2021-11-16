// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkga/a.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/b.cj pkga.%middle -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt src/%n.cj pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

func main():Int64 {
    if ( Coo().foo() is Coo && bb == 1 && Boo().foo() is Boo && aa == 1 ) {
        return 0
    }
    return 2
}
