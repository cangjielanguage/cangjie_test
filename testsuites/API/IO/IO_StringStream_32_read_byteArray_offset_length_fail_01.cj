// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException
from std import io.*


func main(): Int64 {
    try
    {
        StringStream("0123456789").read(Array<UInt8>(10, {i => 1}),1,11)
        ()
    }
    catch(e:IndexOutOfBoundsException)
    {
        print("IndexOutOfBoundsException")
    }
    return 0
}