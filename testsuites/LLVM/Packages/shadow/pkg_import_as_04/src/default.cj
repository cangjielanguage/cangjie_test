// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import pkga.* as alias1 // EXPECTED: regex error.*when setting alias for imported package, it should be 'as alias.*'
import pkgb.b1 as alias2 // EXPECTED: regex-not error
func main(): Int64 {
    return 0
}