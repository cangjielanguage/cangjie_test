// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    var s1 = StringStream("你好23456789")
    s1.ensureCapacity(10)
    var capacity_1 = s1.capacity()
    var s2 = StringStream("\\\n23456789")
    s2.ensureCapacity(30)
    var capacity_2 = s2.capacity()
    var s3 = StringStream("0123456789")
    s3.ensureCapacity(60)
    var capacity_3 = s3.capacity()
    var s4 = StringStream("0123456789")
    s4.ensureCapacity(0)
    var capacity_4 = s4.capacity()
    var s5 = StringStream("0123456789")
    s5.ensureCapacity(-1)
    var capacity_5 = s5.capacity()
    CaseRunner<Int64>().runCases(
        [
            (capacity_1, 26),
            (capacity_2, 54),
            (capacity_3, 60),
            (capacity_4, 26),
            (capacity_5, 26)
        ],
        description: "ensureCapacity的入参测试"
    )
    return 0
}