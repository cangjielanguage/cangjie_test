
// DEPENDENCE:  module012 ../cfg-ast
// EXEC: %compiler %cmp_opt -module-name module012 -c module012/src/pkgs/pkgs.cj -o pkgs.%middle   && %copycharjs module012/src/pkgs
// EXEC: %compiler %cmp_opt %f  -import-config  cfg-ast pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module012  import  pkgs.*

func main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
