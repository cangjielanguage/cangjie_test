// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func main(): Int64 {
    var hashmap1:HashMap<Int8,String> = hashmap2.clone()
    var hashmap3:HashMap<Int8,String> = hashmap1.clone()
    var hashmap4:HashMap<Int8,String> = hashmap3.clone()
    var hashmap5:HashMap<Int8,String> = hashmap4.clone()
    if ( hashmap5.size() == 2 && hashmap5[0] == "0" && hashmap5[1] == "1" ){
        return 0
    }
    return 1
}