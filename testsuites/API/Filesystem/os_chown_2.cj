// DEPENDENCE: test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import os.*
from ffi import c.*
func main() : Int64{
    var result=chown(CString("test_fj_notnull.txt"),Int32(1013),Int32(113))
    if(result==Int32(-1)||result==Int32(0))
    {
        return 0
    }
    return 1
}