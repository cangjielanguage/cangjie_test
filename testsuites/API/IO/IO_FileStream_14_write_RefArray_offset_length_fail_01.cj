// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs =  FileStream("./b/b_file_write.txt")
        var b4 = Array<UInt8>()
        fs.openFile()
        var writenum6 = fs.write(b4,0,1)
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}
