// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): Int64 {
    var i : HashMap<Int32,Int32> =HashMap<Int32,Int32>([(1,1)])
    match (i) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
