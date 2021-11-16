// DEPENDENCE:
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs2 = FileStream("b_file_bcz_01.txt",AccessMode.WriteOnly,OpenMode.OpenOrCreate)
        var b = Array<UInt8>(10, {i => 1})
        fs2.openFile()
        var readnum10 = fs2.read(b,2,3)
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}