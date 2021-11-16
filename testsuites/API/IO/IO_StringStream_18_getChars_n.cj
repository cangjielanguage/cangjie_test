// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*


func main() {
    CaseRunner<ArrayList<Char>>().runCases(
        [
            (ArrayList<Char>(StringStream("").getChars()), ArrayList<Char>(Array<Char>())),
            (ArrayList<Char>(StringStream("1").getChars()), ArrayList<Char>(Array<Char>(['1']))),
            (ArrayList<Char>(StringStream("12345").getChars()), ArrayList<Char>(Array<Char>(['1','2','3','4','5'])))
        ],
        description: "getChars()入参测试"
    )
    return 0
}