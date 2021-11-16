// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([])
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(hashmap1)
var hashmap3:HashMap<Int8,String> = HashMap<Int8,String>()
var hashmap4:HashMap<Int8,String> = HashMap<Int8,String>(0)
var hashmap5:HashMap<Int8,String> = HashMap<Int8,String>(0,{x:Int64=>(Int8(x),x.toString())})
func main(): Int64 {
    if (  hashmap1.size() != 0 ){
        return 1
    }
    if ( hashmap2.size() != 0 ){
        return 2
    }
    if ( hashmap3.size() != 0 ){
        return 3
    }
    if ( hashmap4.size() != 0 ){
        return 4
    }
    if ( hashmap5.size() != 0 ){
        return 5
    }
    return 0
}