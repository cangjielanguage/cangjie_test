// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var r1:Buffer<String> = Buffer<String>(3)
func case01(x:String,m:Int64){
    var a = r1.add(x)
    var b = r1.get(m)
    return match (b){
        case Some(x) => x
        case None =>"No"
    }
}
func main(): Int64 {
    case01("a",Int64(0))
    case01("b",Int64(1))
    case01("c",Int64(2))
    if ( case01("d",Int64(3)) != "d" && r1.size()>3){
        return 1
    }
    return 0
}
