// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(0)
var hashmap2:HashMap<Int8,String> = HashMap<Int8,String>(3)
var hashmap3:HashMap<Int8,String> = HashMap<Int8,String>(1000)
func main(): Int64 {
    if ( hashmap1.capacity() != 16 ){
        return 1
    }
    if ( hashmap2.capacity() != 16 ){
        return 2
    }
    if ( hashmap3.capacity() != 1024 ){
        return 3
    }
    return 0
}