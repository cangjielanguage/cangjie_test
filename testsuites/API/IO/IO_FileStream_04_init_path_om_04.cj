// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [49, 50, 51, 52, 53, 54, 55, 56, 57]
from std import io.*

func main() {
    var fs1 = FileStream("./b/b_04_file_03.txt",OpenMode.Open)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(9, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    return 0
}