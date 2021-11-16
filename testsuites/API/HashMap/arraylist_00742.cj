// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import collection.*
func main(): Int64 {
    var a : Array<HashMap<Int64, Int64>> = [HashMap<Int64,Int64>([(1,1)])].toArray()
    var b : ArrayList<HashMap<Int64,Int64>> = ArrayList<HashMap<Int64,Int64>>(a)
    return b.size() - 1
}