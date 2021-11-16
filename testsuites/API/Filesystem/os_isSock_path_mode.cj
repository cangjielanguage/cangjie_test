// DEPENDENCE: getPath.sh test_fj.txt
// EXEC: chmod +x getPath.sh
// EXEC: ./getPath.sh s
// EXEC: %compiler %stdx_cmp_opt mypath.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from os import os.*
from ffi import c.*

func main() {
    var resulttrue1=isSock(CString(mypath))
    if(resulttrue1!=true){
         return 1
    }
    var resultfalse1=isSock(CString("test_fj.txt"))
    var resultfalse2=isSock(CString("./test_notexists"))
    if(resultfalse1!=false||resultfalse2!=false)
    {
        return 2
    }
    return 0
}