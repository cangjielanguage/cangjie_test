// DEPENDENCE: ../src ../cfg-ast1 ../cfg-ast2
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs01.cj src/pkgs/pkgs02.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    let a: Int32 = pkgs.two
    let b: Int32 = pkgs.three
    if (a == 3 && b == 4) {
        return 0
    }
    return 1
}
