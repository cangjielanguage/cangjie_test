// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").replace("a",0,0).toString(),"a0123456789"),
            (StringStream("0123456789").replace("""
\n""",9,10).toString(),"012345678\n"),
            (StringStream("0123456789").replace(#"@9Dc,高"#,0,10).toString(),"@9Dc,高"),
            (StringStream("0123456789").replace("abc",5,7).toString(),"01234abc789"),
            (StringStream("0123456789").replace("abc",10,12).toString(),"0123456789abc"),
            (StringStream("").replace("abc",0,0).toString(),"abc")
        ],
        description: "replace入参测试"
    )
    return 0
}