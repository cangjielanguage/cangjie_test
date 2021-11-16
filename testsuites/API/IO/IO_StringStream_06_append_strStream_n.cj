// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("1").appends(StringStream("")).toString(),"1"),
            (StringStream("1").appends(StringStream("0123456789qazwsxedcrfvtgbyhnujm你好")).toString(),"10123456789qazwsxedcrfvtgbyhnujm你好"),
            (StringStream("").appends(StringStream("1")).toString(),"1")
        ],
        description: "append_strStream的入参测试"
    )
   return 0
}