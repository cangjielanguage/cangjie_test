// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs =  FileStream("./b/b_file_read.txt")
        var b = Array<UInt8>(10, {i => 1})
        fs.openFile()
        var readnum9 = fs.read(b,10,1)
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}