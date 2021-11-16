// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            FileStream("./b/b_file_01_cz.txt",AccessMode.WriteOnly,OpenMode.Append).canTimeout()
        ],
        description: "FileStream不可Timeout",
        checktype: "AssertFalse"
    )

    return 0
}