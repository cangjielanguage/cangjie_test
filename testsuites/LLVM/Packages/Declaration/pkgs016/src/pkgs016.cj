// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle src/pkgs
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.foo as func1

func main(): Int64 {
    var res = func1()
    if (res != 3) {
        return 1
    }
    return 0
}
