// DEPENDENCE: ../src ../cfg-ast
// ERRCHECK: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// ASSERT: scan redefinition of declaration 'pkgs'

import pkgs

func main(): Int64 {
    let a: Int32 = pkgs.pkgs
    if (a != 1) {
        return 1
    }
    return 0
}
