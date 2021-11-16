// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("1").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,1).toString(),"10"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),5,1).toString(),"5"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),9,1).toString(),"9"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,10).toString(),"0123456789"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,5).toString(),"01234"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),5,5).toString(),"56789"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),4,4).toString(),"4567"),
            (StringStream("").appends(Array<Char>(['0','1','2','3','4','5','6','7','8','9']),5,0).toString(),"")
        ],
        description: "append_str_off_cnt的入参测试"
    )
   return 0
}