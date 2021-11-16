// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*


func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").insert(0,"").toString(),"0123456789"),
            (StringStream("0123456789").insert(5,"""
""").toString(),"0123456789"),
            (StringStream("0123456789").insert(9,#""#).toString(),"0123456789"),
            (StringStream("0123456789").insert(0,"a").toString(),"a0123456789"),
            (StringStream("0123456789").insert(4,"""
1""").toString(),"01231456789"),
            (StringStream("0123456789").insert(9,#"你"#).toString(),"012345678你9"),
            (StringStream("0123456789").insert(0,"\\").toString(),"\\0123456789"),
            (StringStream("0123456789").insert(6,"""
\n""").toString(),"012345\n6789"),
            (StringStream("0123456789").insert(9,#"\n"#).toString(),"012345678\\n9"),
            (StringStream("0123456789").insert(0,"1Ab$;你").toString(),"1Ab$;你0123456789"),
            (StringStream("0123456789").insert(7,"""
!A2.哈""").toString(),"0123456!A2.哈789"),
            (StringStream("0123456789").insert(9,#"@9Dc,高"#).toString(),"012345678@9Dc,高9"),
            (StringStream("0123456789").insert(0,"1Ab$;你\n").toString(),"1Ab$;你\n0123456789"),
            (StringStream("0123456789").insert(3,"""
!A2.她\u{597d}\\""").toString(),"012!A2.她好\\3456789"),
            (StringStream("0123456789").insert(9,#"@9Dc,它\r"#).toString(),"012345678@9Dc,它\\r9"),
            (StringStream("0123456789").insert(10,#"@9Dc,它\r"#).toString(),"0123456789@9Dc,它\\r")
        ],
        description: "insert_insert_string的入参测试"
    )
    return 0
}