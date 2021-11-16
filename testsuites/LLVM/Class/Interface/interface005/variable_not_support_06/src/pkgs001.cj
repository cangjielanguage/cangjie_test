// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkgs.*

func main(): Int64 {
    return 0   
}
