// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(a : HashSet<Int64>): Int64 {
    return 0
}

func main(): Int64 {
    var a : HashSet<Int64> = HashSet<Int64>([1])
    return test(a)
}
