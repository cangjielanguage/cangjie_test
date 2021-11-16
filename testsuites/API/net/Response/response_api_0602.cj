// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
from std import io.*
func main(): Int64 {
    var response1 = Response()
    try
    {
        response1.location()
        ()
    }
    catch(e:Exception)
    {
        print("case pass")
    }
    return 0
}