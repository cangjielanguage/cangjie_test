// DEPENDENCE: pkg
// EXEC: %compiler %stdx_cmp_opt -c pkg/a.cj -o a.o
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


import pkg.res
from std import collection.*
var hashmap01 = res
func main(): Int64 {
    if ( hashmap01.size() == 2 ){
        return 0
    }
    return 1
}
