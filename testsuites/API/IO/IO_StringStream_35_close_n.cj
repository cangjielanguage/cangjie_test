// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var s1 = StringStream("0123456789")
    s1.close()
    var bool1 = s1.isClosed()
    var s2 = StringStream("01\n你好56789")
    s2.close()
    var bool2 = s1.isClosed()
    var s3 = StringStream("")
    s3.close()
    var bool3 = s3.isClosed()
    CaseRunner<Bool>().runCasesTrue(
        [
            bool1,
            bool2,
            bool3
        ],
        description: "StringStream调用close测试"
    )
    return 0
}