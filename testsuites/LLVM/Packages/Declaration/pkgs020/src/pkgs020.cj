// DEPENDENCE: ../cfg-ast
// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto package 'pkgs' is not found

import pkgs

func main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
