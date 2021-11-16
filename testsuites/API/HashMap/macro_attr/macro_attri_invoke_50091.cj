// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %pic_opt
// EXEC: %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
import test.*
from ast import ast.*

func main(){
    @M[HashMap<Int64,Int64>([(1,1)])](0) // Map literal
    return 0
}
