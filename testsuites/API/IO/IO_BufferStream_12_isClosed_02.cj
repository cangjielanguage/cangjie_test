// DEPENDENCE: caserunner.cj c
// EXEC: %compiler %stdx_cmp_opt  %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs = FileStream("./c/c_12_file_02.txt")
    fs.openFile()
    var ss = StringStream("0123456789")
    var bs1 = BufferStream(ss)
    var bs2 = BufferStream(fs)
    bs1.write(Array<UInt8>(10, {i => 1}))
    bs2.write(Array<UInt8>(10, {i => 1}))
    var bool1 = bs1.isClosed()
    var bool2 = bs2.isClosed()
    bs2.close()
    bs1.close()
    var bool3 = bs1.isClosed()
    var bool4 = bs2.isClosed()
    CaseRunner<Bool>().runCasesTrue(
        [
            bool1,
            bool2
        ],
        description: "BufferStream的close前isClose入参测试",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            bool3,
            bool4
        ],
        description: "BufferStream的Close后isClose入参测试"
    )

    return 0
}