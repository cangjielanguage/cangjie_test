// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var map01:HashMap<Int64,Int64> =HashMap<Int64,Int64>([(3,3),(4,5),(5,6)])
    var list_values1 = map01.values()
    var list_values:List<Int64> = [3,5,6]
    for (i in map01.values()){
            print("${i}")
    }
    if (list_values1 != list_values){
        return 1
    }
    return 0
}
