// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var a : HashSet<Int32> = HashSet<Int32>([1])
    var myArray :Array<Array<HashSet<Int32>>> = @{@{a,HashSet<Int32>([1])}}
    return 0
}
