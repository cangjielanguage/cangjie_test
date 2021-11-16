// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException
from std import io.*

func main(): Int64 {
    try
    {
        StringStream("0123456789").subString(5,3)
        ()
    }
    catch(e:IndexOutOfBoundsException)
    {
        print("IndexOutOfBoundsException")
    }
    return 0
}