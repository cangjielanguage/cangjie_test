// DEPENDENCE:  b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [55, 56, 57, 55, 56, 57, 55, 56, 57]
from std import io.*

func main() {
    var fs1 = FileStream("./b/b_02_file_01_cz.txt")
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(9, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    return 0
}