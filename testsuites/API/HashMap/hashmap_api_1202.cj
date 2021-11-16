// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func main(): Int64 {
    hashmap1.removeAll([0,1])
    if ( hashmap1.size() == 0  ){
        return 0
    }
    return 1
}