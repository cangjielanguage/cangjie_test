// DEPENDENCE: caserunner.cj
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*


func main() {
    CaseRunner<String>().runCases(
        [
            (StringStream("0123456789").insert(0,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,1).toString(),"00123456789"),
            (StringStream("0123456789").insert(5,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),9,1).toString(),"01234956789"),
            (StringStream("0123456789").insert(9,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),5,1).toString(),"01234567859"),
            (StringStream("0123456789").insert(2,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,10).toString(),"01012345678923456789"),
            (StringStream("0123456789").insert(0,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),0,6).toString(),"0123450123456789"),
            (StringStream("0123456789").insert(4,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),2,5).toString(),"012323456456789"),
            (StringStream("0123456789").insert(9,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),6,4).toString(),"01234567867899"),
            (StringStream("0123456789").insert(3,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),6,0).toString(),"0123456789"),
            (StringStream("0123456789").insert(10,Array<Char>(['0','1','2','3','4','5','6','7','8','9']),10,0).toString(),"0123456789")
        ],
        description: "insert_index_str_off_cnt的入参测试"
    )
    return 0
}