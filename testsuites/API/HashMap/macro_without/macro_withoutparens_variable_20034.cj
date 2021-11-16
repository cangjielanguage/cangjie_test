// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %pic_opt
// EXEC: %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import macro define.*

from std import collection.*

func test(){
    @M var a : HashMap<Int64,Int64> =HashMap<Int64,Int64>([(1,1)])
}

func main(){
    test()
    return 0
}
