// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %pic_opt
// EXEC: %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
from ast import ast.*
import test.*

func main(){
    @M(HashSet<Int64>([1])) // Set literal
    return 0
}
