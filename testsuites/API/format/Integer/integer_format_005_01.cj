// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*
func main():Int64 {
    var a: UInt32 = 4294967295
    var b: Int64 = -9223372036854775808
    var c = 0
    var d = -0
    try
    {
        var res1= a.format("00O")
        var res2= a.format("0.0O")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}