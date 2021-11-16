// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import  pkgs.*

//external let a  : Int32 = pkgs.one
//let a = pkgs.one

func main(): Int64 {
    let a = pkgs.one
    if (a != 2) {
        return 1
    }
    return 0
}
