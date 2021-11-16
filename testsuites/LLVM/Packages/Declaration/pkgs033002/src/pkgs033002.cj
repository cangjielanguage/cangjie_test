// DEPENDENCE:  module033002 ../cfg-ast
// EXEC: %compiler %cmp_opt -module-name module033002 -c module033002/src/pkgs033002a/pkgs033002a.cj -o pkgs033002a.%middle
// EXEC: %compiler %cmp_opt %f -import-config  cfg-ast  pkgs033002a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module033002 import pkgs033002a.two

func main(): Int64 {
    let b = two
    if (b != 2) {
        return 1
    }
    return 0
}
