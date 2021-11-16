// DEPENDENCE: getPath.sh test_fj.txt
// EXEC: chmod +x getPath.sh
// EXEC: ./getPath.sh b
// EXEC: %compiler %stdx_cmp_opt mypath.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from os import os.*
from ffi import c.*

func main() {
    var resulttrue1=isBlk(CString(mypath))
    print("${mypath}\n")
    print("resulttrue1=${resulttrue1}\n")
    if(resulttrue1!=true){
         return 1
    }
    var resultfalse1=isBlk(CString("test_fj.txt"))
    var resultfalse2=isBlk(CString("./test_notexists"))
    print("resultfalse1=${resultfalse1}\n")
    print("resultfalse2=${resultfalse2}\n")
    if(resultfalse1!=false||resultfalse2!=false)
    {
        return 2
    }
    return 0
}
