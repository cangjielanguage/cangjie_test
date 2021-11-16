// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").delete(0,1).toString(),"123456789"),
            (StringStream("0123456789").delete(9,1).toString(),"012345678"),
            (StringStream("0123456789").delete(0,10).toString(),""),
            (StringStream("0123456789").delete(3,4).toString(),"012789"),
            (StringStream("0123456789").delete(4,6).toString(),"0123"),
            (StringStream("0123456789").delete(2,10).toString(),"01"),
            (StringStream("0123456789").delete(10,3).toString(),"0123456789"),
            (StringStream("0123456789").delete(5,0).toString(),"0123456789"),
            (StringStream("0123456789").delete(10,0).toString(),"0123456789"),
            (StringStream("0123456789").delete(11,1).toString(),"0123456789")
        ],
        description: "delete_index_cnt的入参测试"
    )
    return 0
}