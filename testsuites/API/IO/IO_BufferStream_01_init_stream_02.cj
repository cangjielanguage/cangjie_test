// DEPENDENCE:  c
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [229, 136, 152, 229, 144, 175, 232, 182, 133, 49, 50, 51, 52, 53, 54, 55, 56, 57]
from std import io.*

func main() {
    var fs = FileStream("./c/c_01_file_01_cz.txt")
    if (fs.openFile()){
        var bs: BufferStream = BufferStream(fs)
        var b: Array<UInt8> = Array<UInt8>(18, {i => 1})
        bs.read(b)
        print("${b}")
    }
    return 0
}