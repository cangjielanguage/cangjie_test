// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
func test(): Int64 {
    var i : Int32 = 0
    var a : HashMap<Int32,Int32> = HashMap<Int32,Int32> ([(0,1)])
    match (i) {
        case _ => a
    }
    return 0
}

func main(): Int64 {
    return test()
}
