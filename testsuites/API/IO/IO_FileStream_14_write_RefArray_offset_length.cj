// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs =  FileStream("./b/b_file_write.txt")
    var fs1 = FileStream("b_file_bcz.txt")
    var b = Array<UInt8>(10, {i => 1})
    var b1 = Array<UInt8>(9, {i => 1})
    var b2 = Array<UInt8>(11, {i => 1})
    var b3 = Array<UInt8>(1, {i => 1})
    var b5 = Array<UInt8>(20, {i => 1})
    fs.openFile()
    fs1.openFile()
    var writenum1 = fs1.write(b,0,0)
    var writenum2 = fs.write(b5,0,15)
    var writenum3 = fs.write(b,0,1)
    var writenum4 = fs.write(b,0,5)
    var writenum5 = fs.write(b,0,10)

    CaseRunner<Int64>().runCases(
        [
            (writenum1,0),
            (writenum2,15),
            (writenum3,1),
            (writenum4,5),
            (writenum5,10)
        ],
        description: "write的入参测试"
    )

    return 0
}