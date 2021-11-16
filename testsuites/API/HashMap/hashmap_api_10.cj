// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>([(2,"a"),(3,"b")])
func main(): Int64 {
    hashmap1.putAll(hashmap2)
    if ( hashmap1.size() == 4 && hashmap1[0] == "0" && hashmap1[1] == "1" && hashmap1[2] == "a" && hashmap1[3] == "b"){
        return 0
    }
    return 1
}