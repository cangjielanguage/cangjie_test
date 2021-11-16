// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func main(): Int64 {
    var hashmap1:HashMap<Int8,String> = hashmap2.clone()
    if ( hashmap1.size() == 2 && hashmap1[0] == "0" && hashmap1[1] == "1" ){
        return 0
    }
    return 1
}