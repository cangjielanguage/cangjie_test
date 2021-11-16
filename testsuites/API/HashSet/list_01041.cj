// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): Int64 {
    var a:List<HashSet<Int64>> = [HashSet<Int64>()]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
