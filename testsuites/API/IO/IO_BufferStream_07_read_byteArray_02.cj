// DEPENDENCE: caserunner.cj c
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs1 = FileStream("./c/c_07_file_01.txt")
    var fs2 = FileStream("./c/c_07_file_02.txt")
    var fs3 = FileStream("./c/c_07_file_03.txt")
    var fs4 = FileStream("./c/c_07_file_04.txt")
    var fs5 = FileStream("./c/c_07_file_05.txt")
    fs1.openFile()
    fs2.openFile()
    fs3.openFile()
    fs4.openFile()
    fs5.openFile()
    var readnum1 = BufferStream(fs1).read(Array<UInt8>(10, {i => 1}))
    var readnum2 = BufferStream(fs2).read(Array<UInt8>(10, {i => 1}))
    var readnum3 = BufferStream(fs3).read(Array<UInt8>(10, {i => 1}))
    var readnum4 = BufferStream(fs4).read(Array<UInt8>(10, {i => 1}))
    var readnum5 = BufferStream(fs5).read(Array<UInt8>(10, {i => 1}))
    CaseRunner<Int64>().runCases(
        [
            (readnum1, 10),
            (readnum2, 9),
            (readnum3, 10),
            (readnum4, 1),
            (readnum5, 0)

        ],
        description: "FileStream转换的BufferStream的read入参测试"
    )
    return 0
}