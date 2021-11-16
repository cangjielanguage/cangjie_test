// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1 = HashMap<Int64, Int64>()
func main(): Int64 {
    if ( hashmap1.size() != 0 ){
        return 1
    }
    return 0
}