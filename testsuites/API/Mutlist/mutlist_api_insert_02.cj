// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException

from std import collection.*

func main(): Int64 {
    var r1:Buffer<String> = Buffer<String>(["a","b","c"])
    try{
       r1.insert(Int64(-1),"t")
       ()
    }catch(e:IndexOutOfBoundsException)
    {
       print("IndexOutOfBoundsException\n")
    }

    return 0
}
