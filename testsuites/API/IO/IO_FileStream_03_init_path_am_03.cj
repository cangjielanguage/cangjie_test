// DEPENDENCE:  b
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [65, 66, 67, 68, 69, 65]
from std import io.*


func main() {
    var fs1 = FileStream("b_file_02_bcz.txt",AccessMode.WriteOnly)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>([65,66,67,68,69,65])
        fs1.write(b1)
    }
    fs1.close()
    var fs2 = FileStream("b_file_02_bcz.txt",AccessMode.ReadWrite)
    if (fs2.openFile()){
        var b2: Array<UInt8> = Array<UInt8>(6, {i => 1})
        fs2.read(b2)
        print("${b2}")
    }
    return 0
}