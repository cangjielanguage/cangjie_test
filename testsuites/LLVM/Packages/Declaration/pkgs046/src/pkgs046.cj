// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkga.one, pkgb.one

func main(): Int64 {
    let a = one     // EXPECTED: regex there occurs type ambiguity about var_decl on imported declaration 'one'
    if (a != 1) {
        return 1
    }
    return 0
}
