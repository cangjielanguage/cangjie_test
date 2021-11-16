// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
from std import io.*

func main():Int64{
    try
    {
       var req = Request(RequestMethod.DELETE, "http://111.222")
       ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}