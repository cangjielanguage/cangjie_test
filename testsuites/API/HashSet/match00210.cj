// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): Int64 {
    var a : HashSet<Int32> = HashSet<Int32>([0])
    match (a) {
        case _ => "0"
    }
    return 0
}

func main(): Int64 {
    return test()
}
