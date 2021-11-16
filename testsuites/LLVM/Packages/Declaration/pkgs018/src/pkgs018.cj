// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto illegal object in toplevel

import pkgs is alias1

func main(): Int64 {
    var res = alias1.one + alias1.two
    if (res != 3) {
        return 1
    }
    return 0
}
