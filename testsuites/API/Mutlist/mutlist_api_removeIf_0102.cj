// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func case01(x:(String)->Bool){
    var a = r1.removeIf(x)
    var b = r1.get(1)
    return match (b){
        case Some(y) => y;print("${y}");y
        case None =>"No"
    }
}

func foo(x:String):Bool{
     let b = x=="b"
     if(x=="b")
     {
        return true
     }
     else
     {
        return false
     }

}

func main(): Int64 {

    if ( case01(
          foo
        ) != "c" ){
        return 1
    }
    return 0
}
