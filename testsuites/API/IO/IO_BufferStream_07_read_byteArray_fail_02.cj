// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var readnum1 = BufferStream(StringStream("0123456789")).read(Array<UInt8>())
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}