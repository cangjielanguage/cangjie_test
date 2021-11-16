// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkgs.*

func main(): Int64 {
    var data: D = Data()    // EXPECTED: regex undeclared type name 'D'
    if (data.i == 2) {
        return 0
    }
    return 1
}
