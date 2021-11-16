// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
    [
        (StringStream("").subString(0),""),
        (StringStream("""
""").subString(0),""),
        (StringStream(#""#).subString(0),""),
        (StringStream("a").subString(0),"a"),
        (StringStream("""
1""").subString(0),"1"),
        (StringStream("\n").subString(0),"\n"),
        (StringStream("""
你""").subString(0),"你"),
        (StringStream("1Ab$;你").subString(0),"1Ab$;你"),
        (StringStream("""
!A2.哈""").subString(0),"!A2.哈"),
        (StringStream(#"@9Dc,高"#).subString(0),"@9Dc,高"),
        (StringStream("1Ab$;你\n").subString(0),"1Ab$;你\n"),
        (StringStream("""
!A2.她\u{4f60}""").subString(0),"!A2.她\u{4f60}"),
        (StringStream(#"@9Dc,它\r"#).subString(0),"@9Dc,它\\r")
    ],
    description: "init的入参测试"
    )
    return 0
}