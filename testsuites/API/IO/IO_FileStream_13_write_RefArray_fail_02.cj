// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs =  FileStream("./b/b_file_write.txt")
        fs.openFile()
        var b4 = Array<UInt8>()
        var writenum5 = fs.write(b4)
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}