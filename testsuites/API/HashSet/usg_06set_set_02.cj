// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    let setOne: HashSet<Int32> =  HashSet<Int32> ([5, 6, 7, 5])
    return 0
}