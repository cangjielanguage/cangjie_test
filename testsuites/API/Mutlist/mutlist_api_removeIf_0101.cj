// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)
func main(): Int64 {
    if ( case01(
      {
          //x:String => x=="b"
          x:String=> if(x=="b"){ true }else{ false}
        }
        ) != "c" ){
        return 1
    }
    print("success\n")
    return 0
}

func case01(x:(String)->Bool){
    var a = r1.removeIf(x)
    var b = r1.get(1)
    return match (b){
        case Some(x) => x;print("${x}");x
        case None =>"No"
    }
}
