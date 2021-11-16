// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
        var a: Float16 = -0.34
        var b: Float32 = .34
    try
    {
        var res1 = a.format("k40B")
        var res2= b.format("i0O")
        var res3 = a.format(">8X")
        var res4 = b.format("<8X")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}