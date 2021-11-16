// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c %f  -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto undeclared identifier 'test'

import pkgs.*

func run(): Int64 {
    if (test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
