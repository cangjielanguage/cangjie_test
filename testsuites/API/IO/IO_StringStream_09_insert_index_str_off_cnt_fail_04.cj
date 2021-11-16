// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan IndexOutOfBoundsException: off:  2, cnt:  -1, str.size: 10
from std import io.*

func main(): Int64 {
    try
    {
        StringStream("0123456789").insert(3,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),2,-1)
        ()
    }
    catch(e:IndexOutOfBoundsException)
    {
        print("IndexOutOfBoundsException: off:  2, cnt:  -1, str.size: 10")
    }
    return 0
}