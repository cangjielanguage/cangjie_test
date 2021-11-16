// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("./b/b_file_01_cz.txt",AccessMode.WriteOnly,OpenMode.Append).canSeek()
        ],
        description: "FileStream不可Seek",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
    [
        FileStream("file_02_01_cz.txt",OpenMode.OpenOrCreate).canSeek(),
        FileStream("file_01_bcz.txt",AccessMode.ReadOnly,OpenMode.Truncate).canSeek()
    ],
        description: "FileStream可Seek"
    )

    return 0
}