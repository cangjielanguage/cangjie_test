// DEPENDENCE:  b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan case pass
from std import io.*

func main(): Int64 {
    try
    {
        var fs1 = FileStream("/home/liuqichao/char_api/tests/HLT/LLVM/Class/Class/access/b/B/b_file_01_cz.txt")
        fs1.openFile()
        ()
    }
    catch(e:RuntimeException)
    {
        print("case pass")
    }
    return 0
}