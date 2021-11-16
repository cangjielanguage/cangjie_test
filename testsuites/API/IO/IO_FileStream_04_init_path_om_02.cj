// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Array [1, 1, 1, 1, 1, 1]
from std import io.*

func main() {
    var fs1 = FileStream("./b/b_04_file_02.txt",OpenMode.ForceCreate)
    if (fs1.openFile()){
        var b1: Array<UInt8> = Array<UInt8>([65,66,67,68,69,65])
        fs1.write(b1)
    }
    fs1.close()
    var fs3 = FileStream("./b/b_04_file_02.txt")
    if (fs3.openFile()){
        var b3: Array<UInt8> = Array<UInt8>(6, {i => 1})
        fs3.read(b3)
        print("${b3}\n")
    }
    fs3.close()
    var fs2 = FileStream("./b/b_04_file_02.txt",OpenMode.ForceCreate)
    if (fs2.openFile()){
        var b2: Array<UInt8> = Array<UInt8>(6, {i => 1})
        fs2.read(b2)
        print("${b2}")
    }
    return 0
}