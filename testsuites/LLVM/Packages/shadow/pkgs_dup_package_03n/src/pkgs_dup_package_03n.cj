// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkgs  // EXPECTED: regex it doesn't support importing package by package name

func main(): Int64 {
    let a: Int32 = pkgs
    if (a != 1) {
        return 1
    }
    return 0
}
