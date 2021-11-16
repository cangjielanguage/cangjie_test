// DEPENDENCE: module1 ../cfg-ast
// EXEC: %compiler %cmp_opt -module-name module1 -c module1/src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs module1/src/pkgs
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module1 import pkgs.*

func main(): Int64 {
    var data: pkgs.D = pkgs.Data()
    if (data.i == 2) {
        return 0
    }
    return 1
}
