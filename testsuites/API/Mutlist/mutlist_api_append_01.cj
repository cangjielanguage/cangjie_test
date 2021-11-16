// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var r1:Buffer<String> = Buffer<String>(["a","b","c"])
func case01(x:String){
    var a = r1.add(x)
    var b = r1.get(3)
    return match (b){
        case Some(x) => x
        case None =>"No"
    }
}
func main(): Int64 {
    if ( case01("a") != "a" ){
        return 1
    }
    return 0
}
