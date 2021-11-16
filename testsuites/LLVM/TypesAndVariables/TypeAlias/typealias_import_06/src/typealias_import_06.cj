// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    var data: pkgs.D = pkgs.Data()
    if (data.i == 2) {
        return 0
    }
    return 1
}
