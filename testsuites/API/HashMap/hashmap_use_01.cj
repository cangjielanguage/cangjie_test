// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func foo(hashmap:HashMap<Int8,String>){
    return hashmap
}
func main(): Int64 {
    var value = foo(hashmap1)[1]
    if ( value == "1"){
        return 0
    }
    return 1
}