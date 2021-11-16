// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args >&1 | compare %f
// ASSERT: scan case pass

from std import format.*

func main():Int64 {
    var a: UInt32 = 20
    var flags =  '<'
    var width =  -0
    var precision = -80
    var special = 'l'
    try
    {
        var res = a.format("${flags}${width}.${precision}${special}")
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0

}