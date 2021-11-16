// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
func main(): Int64 {
    try
    {
        var i = "http1.://!$&-ab:12789@www.baidu.com:14?1@=3b##@17"
        let s = URL.parse(i).getOrThrow()
        ()
    }
    catch(e:Exception)
    {
        print("case pass")
    }
    return 0
}