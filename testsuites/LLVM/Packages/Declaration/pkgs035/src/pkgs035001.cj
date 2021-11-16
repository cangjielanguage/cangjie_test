// DEPENDENCE:  module035001 ../cfg-ast
// EXEC: %compiler %cmp_opt -module-name module035001 -c module035001/src/pkgs035001a/pkgs035001a.cj -o pkgs035001a.%middle && %copycharjs module035001/src/pkgs035001a
// EXEC: %compiler %cmp_opt %f  -import-config  cfg-ast pkgs035001a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module035001 import pkgs035001a.*

func main(): Int64 {
    let a = pkgs035001a.one
    let b = pkgs035001a.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
