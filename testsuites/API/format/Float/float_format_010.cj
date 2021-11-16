// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_

    try
    {
        var res1 = a.format("+ ")
        var res2= b.format("# ")
        var res3= c.format("0 ")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}