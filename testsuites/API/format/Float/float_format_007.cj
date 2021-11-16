// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
    var a: Float16 = -0.34
    try
    {
        var res5= a.format("00")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0

}