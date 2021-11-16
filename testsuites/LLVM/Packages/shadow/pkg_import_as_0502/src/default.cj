// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import pkga.* as alias.*
import pkgb.b1 as alias
import pkgb.b2 as alias

func main(): Int64 {
    var m1 = alias.a // EXPECTED: regex error.*undeclared identifier 'a'
    var m2 = alias  // EXPECTED: regex-not error
    return 0
}