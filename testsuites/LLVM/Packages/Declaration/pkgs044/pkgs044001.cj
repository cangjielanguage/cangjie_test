// DEPENDENCE: pkgs044001a pkgs044001b pkgs044001c pkgs044001d pkgs044001e pkgs044001f
// EXEC: %compiler %cmp_opt -c pkgs044001a/pkgs044001a.cj
// EXEC: %compiler %cmp_opt -c pkgs044001b/pkgs044001b.cj
// EXEC: %compiler %cmp_opt -c pkgs044001c/pkgs044001c.cj
// EXEC: %compiler %cmp_opt -c pkgs044001d/pkgs044001d.cj
// EXEC: %compiler %cmp_opt -c pkgs044001e/pkgs044001e.cj
// EXEC: %compiler %cmp_opt -c pkgs044001f/pkgs044001f.cj
// EXEC: %compiler %cmp_opt %n.cj pkgs044001a.%middle pkgs044001b.%middle pkgs044001c.%middle pkgs044001d.%middle pkgs044001e.%middle pkgs044001f.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs044001f.*

func main(): Int64 {
    let a = pkgs044001f.six
    if (a != 6) {
        return 6
    }
    return 0
}
