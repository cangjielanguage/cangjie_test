// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>([(1,"1")])
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
var hashmap3:HashMap<Int8,String> = HashMap<Int8,String>()
var hashmap4:HashMap<Int8,String> = HashMap<Int8,String>(0)
func main(): Int64 {
    hashmap1.reserve(20)
    hashmap2.reserve(20)
    hashmap3.reserve(20)
    hashmap4.reserve(20)
    if ( hashmap1.capacity() != 32 ){
        return 1
    }
    if ( hashmap2.capacity() != 32  ){
        return 2
    }
    if ( hashmap3.capacity() != 32 ){
        return 3
    }
    if ( hashmap4.capacity() != 32 ){
        return 4
    }
    return 0
}