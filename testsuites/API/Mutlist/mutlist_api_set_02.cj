// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args  | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func case01(x:Int64,y!:String = "y"){
    var a = r1.set(x,y)
    var b = r1.get(x)
    return match (b){
        case Some(z) => z
        case None =>"No"
    }
}

func main(): Int64 {
   try{
        if ( case01(4) != "y" ){
            return 1
        }
   }catch(e:IndexOutOfBoundsException)
   {
      print("IndexOutOfBoundsException\n")
   }
    return 0
}
