// DEPENDENCE: caserunner.cj c
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs = FileStream("./c/c_11_file_11.txt")
    fs.openFile()
    var ss = StringStream("0123456789")
    var bs1 = BufferStream(ss)
    var bs2 = BufferStream(fs)
    bs1.write(Array<UInt8>(10, {i => 1}))
    bs2.write(Array<UInt8>(10, {i => 1}))
    bs2.close()
    bs1.close()
    CaseRunner<Bool>().runCasesTrue(
        [
            bs1.isClosed(),
            bs2.isClosed()
        ],
        description: "BufferStream的close入参测试"
    )


    return 0
}