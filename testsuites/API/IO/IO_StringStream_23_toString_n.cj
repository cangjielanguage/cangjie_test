// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("").toString(),""),
            (StringStream("a").toString(),"a"),
            (StringStream("0aZ;\n你\u{597d}").toString(),"0aZ;\n你好")
        ],
        description: "toString的调用测试"
    )
return 0
}