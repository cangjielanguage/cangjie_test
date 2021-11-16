// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %pic_opt
// EXEC: %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import macro define.*
from std import collection.*
import ast.*
func test(){
    @M var a : HashSet<Int64> = HashSet<Int64>([1])
}

func main(){
    test()
    return 0
}
