// DEPENDENCE: c
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs7 = FileStream("./c/c_09_file_04.txt",AccessMode.ReadOnly)
        fs7.openFile()
        var readnum7 = BufferStream(fs7).write(Array<UInt8>(10, {i => 1}))
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}