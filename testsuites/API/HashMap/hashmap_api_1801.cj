// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>()
func main(): Int64 {
    var hashset1 = hashmap1.keys()
    if (  hashset1.isEmpty() ){
        return 0
    }
    return 1
}