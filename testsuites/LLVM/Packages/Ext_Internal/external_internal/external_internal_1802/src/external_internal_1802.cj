// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*
func main(): Int64 {
    return 0
}
