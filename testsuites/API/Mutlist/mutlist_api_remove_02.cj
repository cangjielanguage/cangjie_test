// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)

func main(): Int64 {
   try{
        r1.remove(-1)
   }catch(e:IndexOutOfBoundsException)
   {
      print("IndexOutOfBoundsException\n")
   }
    return 0
}
