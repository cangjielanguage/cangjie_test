// DEPENDENCE: c
// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [97, 65, 49, 50, 51, 52, 53, 54, 55, 56, 57]
from std import io.*

func main() {
    var fs = FileStream("./c/c_02_file_01_cz.txt")
    if (fs.openFile()){
        var bs: BufferStream = BufferStream(fs,4097)
        var b: Array<UInt8> = Array<UInt8>(11, {i => 1})
        bs.read(b)
        print("${b}")
    }
    return 0
}