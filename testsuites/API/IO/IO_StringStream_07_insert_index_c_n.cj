// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").insert(0,'a').toString(),"a0123456789"),
            (StringStream("0123456789").insert(5,'\n').toString(),"01234\n56789"),
            (StringStream("0123456789").insert(9,'\"').toString(),"012345678\"9"),
            (StringStream("0123456789").insert(6,'\'').toString(),"012345'6789"),
            (StringStream("0123456789").insert(3,'\u{4f60}').toString(),"012你3456789"),
            (StringStream("0123456789").insert(7,'好').toString(),"0123456好789"),
            (StringStream("0123456789").insert(10,'好').toString(),"0123456789好")
        ],
        description: "insert_char的入参测试"
    )
    return 0
}