// DEPENDENCE:  b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs1 = FileStream("./b/b_04_file_02_bcz.txt",AccessMode.ReadOnly,OpenMode.Append)
        fs1.openFile()
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}