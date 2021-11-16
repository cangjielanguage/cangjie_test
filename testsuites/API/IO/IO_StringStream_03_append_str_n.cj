// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("1").appends(Array<Char>()).toString(),"1"),
            (StringStream("").appends(Array<Char>(['0'])).toString(),"0"),
            (StringStream("").appends(Array<Char>(['A'])).toString(),"A"),
            (StringStream("").appends(Array<Char>(['\u{4f60}'])).toString(),"你"),
            (StringStream("").appends(Array<Char>(['好'])).toString(),"好"),
            (StringStream("").appends(Array<Char>(['\n'])).toString(),"\n"),
            (StringStream("").appends(Array<Char>(['0','A','\u{4f60}','好','\n'])).toString(),"0A你好\n")
        ],
        description: "append_str的入参测试"
    )
    return 0
}