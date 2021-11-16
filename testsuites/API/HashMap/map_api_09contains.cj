// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var map01:HashMap<Int64,Int64> =HashMap<Int64,Int64>([(3,3),(4,5),(5,6)])
var bool3 = map01.contains(3)
var bool4 = map01.contains(4)
var bool5 = map01.contains(5)
func main(): Int64 {
    if ( bool3  && bool4  && bool5 ){
        return 0
    }
    return 1
}