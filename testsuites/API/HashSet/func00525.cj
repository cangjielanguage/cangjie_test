// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): HashSet<Int64>{
    let a : HashSet<Int64> = HashSet<Int64>([1])
    return a
}

func main(): Int64 {
    test()
    return 0
}
