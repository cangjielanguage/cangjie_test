// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("./b/b_file_01_cz.txt",AccessMode.WriteOnly,OpenMode.Append).canRead()
        ],
        description: "FileStream不可读",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("file_02_01_cz.txt",OpenMode.OpenOrCreate).canRead(),
            FileStream("file_01_bcz.txt",AccessMode.ReadOnly,OpenMode.Truncate).canRead()
        ],
        description: "FileStream可读"
    )
    return 0
}