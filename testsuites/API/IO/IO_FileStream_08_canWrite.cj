// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("file_02_01_cz.txt",OpenMode.OpenOrCreate).canWrite(),
            FileStream("./b/b_file_01_cz.txt",AccessMode.WriteOnly,OpenMode.Append).canWrite()
        ],
        description: "FileStream可写"

    )
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("file_01_bcz.txt",AccessMode.ReadOnly,OpenMode.Truncate).canWrite()
        ],
        description: "FileStream不可写",
        checktype: "AssertFalse"
    )

    return 0
}