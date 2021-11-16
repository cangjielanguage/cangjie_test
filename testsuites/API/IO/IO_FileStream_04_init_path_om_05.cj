// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [57, 56, 55, 54, 53, 52, 51, 50, 49]
from std import io.*


func main() {
    var fs1 = FileStream("./b/b_04_file_04.txt",OpenMode.OpenOrCreate)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(9, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    return 0
}