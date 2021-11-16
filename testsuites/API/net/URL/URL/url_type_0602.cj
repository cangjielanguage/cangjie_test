// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass

from std import net.*
func main(): Int64 {
    try
    {
        var i = "http:other.example.com?1a;=A53#Ab1"
        let s = URL.parseRequestURI(i).getOrThrow()
        ()
    }
    catch(e:Exception)
    {
        print("case pass")
    }
    return 0
}