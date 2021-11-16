// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): Int64 {
    let sum = { a: HashMap<Int32, String> => a}
    return 0
}

func main(): Int64 {
    return test()
}
