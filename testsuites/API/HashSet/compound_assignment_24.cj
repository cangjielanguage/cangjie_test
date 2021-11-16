// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var a = 2
    let b = HashSet<Int64>([1,2,3])
    for (i in b) {
        a -=1
        a +=2
    }
    if (a==5) {
        return 0
    }
    return 1
}
