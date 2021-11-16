// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:Buffer<String> = Buffer<String>(str)
    var r2:Buffer<String> = Buffer<String>(["d","e","f"])
    try{
       r1.insertAll(Int64(-1),r2)
    }catch(e:IndexOutOfBoundsException)
    {
       print("IndexOutOfBoundsException\n")
    }
    return 0
}
