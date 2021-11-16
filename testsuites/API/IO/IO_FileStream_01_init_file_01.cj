// DEPENDENCE: b
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// ASSERT: scan Array [49, 50, 51, 52, 53, 54, 55, 56, 57, 48]
from std import io.*

func main() {
    var file = FileInfo("./b/b_01_file_01_cz.txt")
    print("path:${file.getCanonicalPath()}\n")
    var fs1 = FileStream(file)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(10, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    return 0
}