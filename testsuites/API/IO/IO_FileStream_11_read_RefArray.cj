// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs =  FileStream("./b/b_file_read.txt")
    var fs1 = FileStream("b_file_bcz.txt")
    var fs3 = FileStream("b_file_bcz_01.txt",AccessMode.WriteOnly,OpenMode.OpenOrCreate)
    var b = Array<UInt8>(10, {i => 1})
    var b1 = Array<UInt8>(9, {i => 1})
    var b2 = Array<UInt8>(11, {i => 1})
    var b3 = Array<UInt8>(1, {i => 1})
    fs.openFile()
    fs1.openFile()
    fs3.openFile()
    var readnum1 =fs.read(b)
    fs.seek(0,BeginPos)
    var readnum2 =fs.read(b1)
    fs.seek(0,BeginPos)
    var readnum3 =fs.read(b2)
    fs.seek(0,BeginPos)
    var readnum4 =fs.read(b3)
    fs.seek(0,BeginPos)
    var readnum6 =fs1.read(b)
    CaseRunner<Int64>().runCases(
        [
            (readnum1, 10),
            (readnum2, 9),
            (readnum3, 10),
            (readnum4, 1),
            (readnum6, 0)
        ],
        description: "read的入参测试"
    )

return 0
}