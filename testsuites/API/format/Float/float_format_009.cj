// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    try
    {
        var res1 = a.format("-0")
        var res2= b.format("--20")
        var res3= b.format("-0.02")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}