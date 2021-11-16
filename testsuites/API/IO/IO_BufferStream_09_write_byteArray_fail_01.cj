// DEPENDENCE: caserunner.cj c
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs3 = FileStream("./c/c_09_file_03.txt")
        fs3.openFile()
        var writenum3 = BufferStream(fs3).write(Array<UInt8>())
        ()
    }
    catch(e:IndexOutOfBoundsException)
    {
        print("case pass")
    }
    return 0
}