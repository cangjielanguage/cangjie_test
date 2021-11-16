// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var fs =  FileStream("./b/b_file_write.txt")
    fs.openFile()
    fs.close()
    var fs1 = FileStream("b_file_bcz.txt")
    fs1.openFile()
    fs1.close()
    var fs2 = FileStream("b_file_bcz_01.txt",AccessMode.WriteOnly,OpenMode.OpenOrCreate)
    fs2.openFile()
    fs2.close()
    CaseRunner<Bool>().runCasesTrue(
        [
            fs.isClosed(),
            fs1.isClosed(),
            fs2.isClosed()

        ],
        description: "FileStream调用close()测试"
    )

    return 0
}