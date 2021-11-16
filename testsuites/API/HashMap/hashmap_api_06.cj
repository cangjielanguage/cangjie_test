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
    if ( hashmap1.size() == 2 && case01(0) == "0" && case01(1) == "1" ){
        return 0
    }
    return 1
}