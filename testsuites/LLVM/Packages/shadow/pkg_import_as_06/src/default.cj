// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkga/pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import pkga.pkgb.* as alias2.*.* // EXPECTED: regex error.*expected newline or ';' after importspec
func main(): Int64 {
    return 0
}