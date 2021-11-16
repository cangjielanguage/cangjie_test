// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var r1:Buffer<String> = Buffer<String>(3,{x:Int64=>x.toString()})
func case01(){
    var a = r1.size()
    return a
}

func case02(){
    var a = r1.get(1)
    return match (a){
        case Some(x) => x
        case None =>"Not"
    }
}

func main(): Int64 {
    if ( case01() != 3 ){
        return 1
    }
    if ( case02() != "1" ){
        return 2
    }
    return 0
}
