// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        BufferStream(StringStream("0123456789")).write(Array<UInt8>(10, {i => 1}),11,0)
        ()
    }
    catch(e:IndexOutOfBoundsException)
    {
        print("case pass")
    }
    return 0
}