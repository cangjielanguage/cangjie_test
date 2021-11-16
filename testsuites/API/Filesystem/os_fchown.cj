// DEPENDENCE: test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
from std import os.*
from ffi import c.*
func main() : Int64{
    var op=`open`(CString("test_fj.txt"), O_RDONLY)
    var op1=`open`(CString(""), O_RDONLY)
    var op2=`open`(CString("test_fj_notnull.txt"), O_RDONLY)
    var result:Array<Int32>=Array<Int32>([fchown(op,Int32(1),Int32(2)),
                                           fchown(op,Int32(0),Int32(0)),
                                           fchown(op1,Int32(1),Int32(2)),
                                           fchown(op1,Int32(0),Int32(0)),
                                           fchown(op2,Int32(1),Int32(2)),
                                           fchown(op2,Int32(0),Int32(0))])
    for (i in result){
        if(i!=Int32(0)&&i!=Int32(-1)){
              return 1
        }
    }
   return 0
}
