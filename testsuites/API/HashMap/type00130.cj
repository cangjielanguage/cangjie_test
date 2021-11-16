// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): Int64 {
    var i : HashMap<Int32,Int32> = HashMap<Int32,Int32>([(1,1)])
    var res = match (i) {
        case a : HashMap<Int32,Int32> => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
