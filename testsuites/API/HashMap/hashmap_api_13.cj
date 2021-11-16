// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*
var hashmap1:HashMap<Int8,String> = HashMap<Int8,String>(3,{x:Int64=>(Int8(x),x.toString())})
func case01(x:Int8,y:String):Bool{
    if(x==0 && y== "0"){
        return true
    }
    return false
}
func case01(x:Int8){
    var a = hashmap1.get(x)
    return match (a){
        case Some(x) => x
        case None =>"No"
    }
}
func main(): Int64 {
    hashmap1.removeIf(case01)
    if(hashmap1.size() == 2 &&  case01(1) == "1" &&  case01(2) == "2"){
        return 0
    }
    return 1
}