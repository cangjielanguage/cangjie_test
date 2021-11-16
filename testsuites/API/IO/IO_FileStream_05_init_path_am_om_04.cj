// DEPENDENCE:  b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [49, 50, 51, 52, 53, 54, 55, 56, 57, 58]
from std import io.*

func main() {
    var fs = FileStream("./b/b_05_file_04.txt",OpenMode.ForceCreate)
    fs.openFile()
    fs.close()
    var fs2 = FileStream("./b/b_05_file_04.txt",AccessMode.WriteOnly,OpenMode.Open)
    if (fs2.openFile()){
        var b2: Array<UInt8> = Array<UInt8>([49, 50, 51, 52, 53, 54, 55, 56, 57, 58])
        fs2.write(b2)
    }
    fs2.close()
    var fs1 = FileStream("./b/b_05_file_04.txt",AccessMode.ReadOnly,OpenMode.Open)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(10, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    fs1.close()
    return 0
}