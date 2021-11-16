// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkga/a.cj -o a.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/b.cj a.%middle -o b.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt src/%n.cj a.%middle b.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.Coo
import pkga.Boo
func main():Int64 {
    if ( Coo.foo<Int32>(1,2) != 2 || Boo<Int32>.foo<Int64>(3,1) != 1) {
        return 1
    }
    return 0
}
