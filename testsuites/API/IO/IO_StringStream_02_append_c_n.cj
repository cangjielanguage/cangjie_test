// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("1").appends('0').toString(),"10"),
            (StringStream("").appends('9').toString(),"9"),
            (StringStream("").appends('\u{4f60}').toString(),"你"),
            (StringStream("").appends('Z').toString(),"Z"),
            (StringStream("").appends('a').toString(),"a"),
            (StringStream("").appends('好').toString(),"好"),
            (StringStream("").appends('[').toString(),"["),
            (StringStream("").appends('`').toString(),"`"),
            (StringStream("").appends('\r').toString(),"\r"),
            (StringStream("").appends('\n').toString(),"\n"),
            (StringStream("").appends('\"').toString(),"\""),
            (StringStream("").appends('\'').toString(),"'"),
            (StringStream("").appends('\\').toString(),"\\"),
            (StringStream("").appends('\b').toString(),"\b"),
            (StringStream("").appends('\0').toString(),"\0")
        ],
        description: "append_char的入参测试"
    )
    return 0
}