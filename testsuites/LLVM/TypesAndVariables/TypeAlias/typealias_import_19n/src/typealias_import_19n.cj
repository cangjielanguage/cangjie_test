// DEPENDENCE: module1 ../cfg-ast
// EXEC: %compiler %cmp_opt -c module1/src/pkgs/pkgs.cj -o module1/pkgs.%middle
// EXEC: %compiler %cmp_opt %f module1/pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

from module1 import pkgs.*

func main(): Int64 {
    var data: pkgs.D = pkgs.Data()    // EXPECTED: regex undeclared type name 'D'
    if (data.i == 2) {
        return 0
    }
    return 1
}
