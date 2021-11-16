// DEPENDENCE: module037001 ../cfg-ast
// EXEC: %compiler %cmp_opt -module-name module037001 -c module037001/src/pkgs037001a/pkgs037001a.cj -o pkgs037001a.%middle && %copycharjs module037001/src/pkgs037001a
// EXEC: %compiler %cmp_opt -module-name module037001 -c module037001/src/pkgs037001b/pkgs037001b.cj -o pkgs037001b.%middle && %copycharjs module037001/src/pkgs037001b
// EXEC: %compiler %cmp_opt %f -import-config  cfg-ast  pkgs037001a.%middle pkgs037001b.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module037001 import pkgs037001a.*, pkgs037001b.*

func main(): Int64 {
    let a = pkgs037001a.one
    let b = pkgs037001b.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
