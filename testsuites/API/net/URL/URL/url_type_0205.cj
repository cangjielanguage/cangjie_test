// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
func main(): Int64 {
    try
    {
        var i = "http://121www.你asd12.%E4%BD%A0com%40:789ad@110.8.8.10:50"
        let s = URL.parse(i).getOrThrow()
        ()
    }
    catch(e:Exception)
    {
        print("case pass")
    }
    return 0
}