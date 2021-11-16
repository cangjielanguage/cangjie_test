// DEPENDENCE: caserunner.cj c
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs1 = FileStream("./c/c_09_file_01.txt")
    var fs2 = FileStream("./c/c_09_file_02.txt")
    var fs3 = FileStream("./c/c_09_file_03.txt")
    fs1.openFile()
    fs2.openFile()
    fs3.openFile()
    var writenum1 = BufferStream(fs1).write(Array<UInt8>(10, {i => 1}))
    var writenum2 = BufferStream(fs2).write(Array<UInt8>(10, {i => 1}))
    var writenum3 = BufferStream(fs3).write(Array<UInt8>())
    fs1.close()
    fs2.close()
    fs3.close()
    CaseRunner<Int64>().runCases(
        [
            (writenum1, 10),
            (writenum2, 10),
            (writenum3, 0)
        ],
        description: "FileStream转换的BufferStream的write入参测试"
    )
    return 0
}