// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").insert(0,Array<Char>()).toString(),"0123456789"),
            (StringStream("0123456789").insert(5,Array<Char>(['\n'])).toString(),"01234\n56789"),
            (StringStream("0123456789").insert(9,Array<Char>(['a'])).toString(),"012345678a9"),
            (StringStream("0123456789").insert(4,Array<Char>(['\"'])).toString(),"0123\"456789"),
            (StringStream("0123456789").insert(6,Array<Char>(['好'])).toString(),"012345好6789"),
            (StringStream("0123456789").insert(3,Array<Char>(['\u{4f60}'])).toString(),"012你3456789"),
            (StringStream("0123456789").insert(2,Array<Char>(['a','\"','好','\u{4f60}'])).toString(),"01a\"好你23456789"),
            (StringStream("0123456789").insert(10,Array<Char>(['a','\"','好','\u{4f60}'])).toString(),"0123456789a\"好你")
        ],
        description: "insert_insert_str的入参测试"
    )
    return 0
}