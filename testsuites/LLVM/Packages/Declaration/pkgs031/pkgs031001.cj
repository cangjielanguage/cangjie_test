// DEPENDENCE:  module031001
// EXEC: %compiler %cmp_opt -c module031001/src/pkgs031001a/pkgs031001a.cj -o module031001/pkgs031001a.%middle  && %copycharjs module031001/
// EXEC: %compiler %cmp_opt %n.cj module031001/pkgs031001a.%middle -o %output
// EXEC: %run %run_opt %output %run_args
from module031001 import pkgs031001a.* as alias031001.*

func main(): Int64 {
    let a = alias031001.one
    let b = alias031001.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
