// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs3 = FileStream("./b/b_file_write_01.txt",AccessMode.ReadOnly)
        var b = Array<UInt8>(10, {i => 1})
        fs3.openFile()
        var writenum8 = fs3.write(b)
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}