// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs =  FileStream("./b/b_file_read.txt")
    var fs1 = FileStream("b_file_bcz.txt")
    var fs2 = FileStream("b_file_bcz_01.txt",AccessMode.WriteOnly,OpenMode.OpenOrCreate)
    var b = Array<UInt8>(10, {i => 1})
    var b1 = Array<UInt8>(9, {i => 1})
    var b2 = Array<UInt8>(11, {i => 1})
    var b3 = Array<UInt8>(1, {i => 1})
    var b4 = Array<UInt8>()
    var b5 = Array<UInt8>(20, {i => 1})
    fs.openFile()
    fs1.openFile()
    fs2.openFile()
    var readnum1 = fs1.read(b,0,0)
    var readnum2 = fs.read(b5,0,15)
    fs.seek(0,BeginPos)
    var readnum3 = fs.read(b,0,1)
    fs.seek(0,BeginPos)
    var readnum4 = fs.read(b,0,5)
    fs.seek(0,BeginPos)
    var readnum5 = fs.read(b,0,10)
    CaseRunner<Int64>().runCases(
        [
          (readnum1,0),
          (readnum2,10),
          (readnum3,1),
          (readnum4,5),
          (readnum5,10)
        ],
        description: "read的入参测试"
      )
   return 0
}