// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var HashMap01:HashMap<(Int64),HashMap<Int64,String>> = HashMap<(Int64),HashMap<Int64,String>>([((1),HashMap<Int64,String>([(1,"a")]))])
    var value1 = HashMap01[(1)][1]
    if (HashMap01.size() == 1 && value1 == "a"){
        return 0
    }
    return 1
}