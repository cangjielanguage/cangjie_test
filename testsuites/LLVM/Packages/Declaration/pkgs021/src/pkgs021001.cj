// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    var a = pkgs.A()
    if (a.one != 10) {
        return 1
    }
    return 0
}
