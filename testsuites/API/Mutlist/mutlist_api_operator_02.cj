// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func case01(x:Int64){
    var a = r1[x]
    return a
}

func main(): Int64 {
   try{
       if ( case01(3) != "b" ){
           return 1
       }
   }catch(e:IndexOutOfBoundsException)
   {
      print("IndexOutOfBoundsException\n")
   }
    return 0
}
