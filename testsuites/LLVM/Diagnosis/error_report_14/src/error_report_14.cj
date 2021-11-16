// DEPENDENCE: ../src
// EXEC-PIPE-1:%compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE-1:%compiler %cmp_opt src/%n.cj pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex found candidate

import pkgs.*

func main(): Int64 {
    foo()
    return 0
}
