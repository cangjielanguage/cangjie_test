// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.A

func main(): Int64 {
    var a = A.one
    if a != 10 {
        return 1
    }
    return 0
}
