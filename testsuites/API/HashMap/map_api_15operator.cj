// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var map01:HashMap<Int64,Int64> =HashMap<Int64,Int64>([(3,3),(4,5),(5,6)])
    var value3 = map01[3]
    var value4 = map01[4]
    var value5 = map01[5]
    if (value3 == 3 && value4 == 5 && value5 == 6 ){
        return 0
    }
    return 1
}