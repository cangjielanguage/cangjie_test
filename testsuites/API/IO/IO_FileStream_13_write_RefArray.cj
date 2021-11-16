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
    fs.openFile()
    fs1.openFile()
    var writenum1 = fs.write(b)
    var writenum2 = fs.write(b1)
    var writenum3 = fs.write(b2)
    var writenum4 = fs.write(b3)
    var writenum7 = fs1.write(b)

    CaseRunner<Int64>().runCases(
        [
            ( writenum1, 10),
            ( writenum2, 9),
            ( writenum3, 11),
            ( writenum4, 1),
            ( writenum7, 10)

        ],
        description: "write的入参测试"
    )

    return 0
}