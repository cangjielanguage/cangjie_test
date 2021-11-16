// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
    var c = 0
    try
    {
        var res3= c.format("0 ")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}