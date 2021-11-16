// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func foo(a:Int64):Int64{
    return a
}
func main(): Int64 {
    if ( foo(hashmap1.size()) == 2){
        return 0
    }
    return 1
}