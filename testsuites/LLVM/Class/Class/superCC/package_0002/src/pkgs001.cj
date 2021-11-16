// DEPENDENCE: ../src ../cfg-ast ../cfg2-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt -c src/pkgs2/pkgs2.cj -o pkgs2.%middle && %copycharjs src/pkgs2
// EXEC: %compiler %cmp_opt %f  pkgs.%middle pkgs2.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*
import pkgs2.*

func main(): Int64 {
    C2().f()
    return (a - 3)
}
