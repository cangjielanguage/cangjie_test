// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").deleteChaAt(0).toString(),"123456789"),
            (StringStream("0123456789").deleteChaAt(4).toString(),"012356789"),
            (StringStream("0123456789").deleteChaAt(9).toString(),"012345678")
        ],
        description: "deleteChaAt的入参测试"
    )
    return 0
}