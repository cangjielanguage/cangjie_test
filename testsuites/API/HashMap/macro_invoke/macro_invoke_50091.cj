// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %pic_opt
// EXEC: %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import collection.*
import test.*
import ast.*
func main(){
    @M(HashMap<Int64,Int64>([(1,1)])) // Map literal
    return 0
}
