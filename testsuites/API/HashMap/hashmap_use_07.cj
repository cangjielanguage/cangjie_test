// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func foo(value!:Int64 = hashmap1.size()):String{
    return hashmap1[0]
}
func main(): Int64 {
    if ( foo() == "0"){
        return 0
    }
    return 1
}