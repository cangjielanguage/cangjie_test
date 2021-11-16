// DEPENDENCE: ../src ../cfg-ast
// ERRCHECK: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan external type 'D' refers to internal 'Data'

import pkgs.*

func main(): Int64 {
    var data: D = Data()
    if (data.i == 2) {
        return 0
    }
    return 1
}
