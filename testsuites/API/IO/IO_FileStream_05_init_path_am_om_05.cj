// DEPENDENCE:  05_file_19.txt
// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 69, 65, 65, 65]
from std import io.*

func main() {
    var fs = FileStream("05_file_19.txt",AccessMode.WriteOnly,OpenMode.ForceCreate)
    if (fs.openFile()){
        var b: Array<UInt8> = Array<UInt8>([65,66,67,68,69,65,65,66,67,68,69,65,65,65])
        fs.write(b)
    }
    fs.close()
    var fs2 = FileStream("05_file_19.txt",AccessMode.WriteOnly,OpenMode.OpenOrCreate)
    if (fs2.openFile()){
        var b2: Array<UInt8> = Array<UInt8>([49, 50, 51, 52, 53, 54, 55, 56, 57, 58])
        var a = fs2.write(b2)
        fs2.flush()
    }
    fs2.close()
    var fs1 = FileStream("05_file_19.txt",AccessMode.ReadWrite,OpenMode.OpenOrCreate)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>(14, {i => 1})
        fs1.read(b1)
        print("${b1}")
    }
    fs1.close()
    return 0
}