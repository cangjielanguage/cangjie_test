// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(a : HashMap<Int64, String>): Int64 {
    return 0
}

func main(): Int64 {
    let a : HashMap<Int64, String> =HashMap<Int64,String>([(0, "test")])
    return test(a)
}
