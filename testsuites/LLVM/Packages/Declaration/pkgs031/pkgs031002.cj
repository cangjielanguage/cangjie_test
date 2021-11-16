// DEPENDENCE:  module031001 cfg-ast
// EXEC: mkdir -p module031001/out/pkgs031001a
// EXEC: %compiler %cmp_opt -module-name module031001 -c module031001/src/pkgs031001a/pkgs031001a.cj -o module031001/out/pkgs031001a/pkgs031001a.%middle && %copycharjs module031001/src/pkgs031001a
// EXEC: %compiler %cmp_opt %n.cj  -import-config  cfg-ast  module031001/out/pkgs031001a/pkgs031001a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module031001 import pkgs031001a.*

func main(): Int64 {
    let a = pkgs031001a.one
    let b = pkgs031001a.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
