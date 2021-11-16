// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(2,{x:Int64=>(Int8(x),x.toString())})
func case01(x:Int8){
    var a = hashmap1.get(x)
    return match (a){
        case Some(x) => x
        case None =>"No"
    }
}
func main(): Int64 {
    if ( case01(10) == "No" ){
        return 0
    }
    return 1
}