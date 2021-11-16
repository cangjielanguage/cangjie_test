// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("1").appends("").toString(),"1"),
            (StringStream("").appends("""
""").toString(),""),
            (StringStream("").appends(#""#).toString(),""),
            (StringStream("").appends("a").toString(),"a"),
            (StringStream("").appends("""
1""").toString(),"1"),
            (StringStream("").appends(#"A"#).toString(),"A"),
            (StringStream("").appends("\n").toString(),"\n"),
            (StringStream("").appends("""
你""").toString(),"你"),
            (StringStream("").appends(#":"#).toString(),":"),
            (StringStream("").appends("1Ab$;你").toString(),"1Ab$;你"),
            (StringStream("").appends("""
!A2.哈""").toString(),"!A2.哈"),
            (StringStream("").appends("""
!A2.她\n""").toString(),"!A2.她\n"),
            (StringStream("").appends(#"@9Dc,它\r"#).toString(),"@9Dc,它\\r")
        ],
        description: "append_string的入参测试"
    )
    return 0
}