// DEPENDENCE:  module033001 ../cfg-ast
// EXEC: %compiler %cmp_opt -c module033001/src/pkgs033001a/pkgs033001a.cj -o module033001/pkgs033001a.%middle 
// EXEC: %compiler %cmp_opt %n.cj   module033001/pkgs033001a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

from module033001 import pkgs033001a.two as alias033001

func main(): Int64 {
    let b = alias033001
    if (b != 2) {
        return 1
    }
    return 0
}
