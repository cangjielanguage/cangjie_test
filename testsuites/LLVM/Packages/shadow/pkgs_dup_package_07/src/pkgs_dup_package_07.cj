// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 2>&1| compare %f
// ASSERT: scan redefinition of declaration 'pkgs'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkgs.*

var res = pkgs
func run(): Int64 {
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
