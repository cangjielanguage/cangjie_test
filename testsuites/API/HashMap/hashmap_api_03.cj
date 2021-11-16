// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var list01:List<Int8*String> = [(1,"1")]
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(list01)
func main(): Int64 {
    if ( hashmap1.size() == 1 && hashmap1[1] == "1"){
        return 0
    }
    return 1
}