// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.foo as true // EXPECTED: regex expected identifier here

func main(): Int64 {
    var res = true()
    if (res != 3) {
        return 1
    }
    return 0
}
