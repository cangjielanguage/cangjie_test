// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto 'A' is not a member of package 'pkgs'

import pkgs.*

func main(): Int64 {
    var a = pkgs.A()
    if (a.one != 10) {
        return 1
    }
    return 0
}
