// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import format.*
func main():Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 30.0
    try
    {
        var res1 = a.format("#")
        var res2 = b.format("#")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
        return 1
    }
    return 0
}