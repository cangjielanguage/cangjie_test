// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args  | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(3)

func case01(x:Int64,y!:String = "y"){
    var a = r1.set(x,y)
}

func main(): Int64 {
   try{
       case01(4)
       ()
   }catch(e:IndexOutOfBoundsException)
   {
      print("IndexOutOfBoundsException\n")
   }
    return 0
}
