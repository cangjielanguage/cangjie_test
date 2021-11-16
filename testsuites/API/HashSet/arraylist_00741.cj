// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    var a : Array<HashSet<Int64>> = [HashSet<Int64>([1])].toArray()
    var b : ArrayList<HashSet<Int64>> = ArrayList<HashSet<Int64>>(a)
    return b.size() - 1
}