// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.* as alias032.*

func main(): Int64 {
    let a = alias032.one
    let b = alias032.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
