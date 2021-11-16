// DEPENDENCE: %n.c
// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=`%stdx_run %stdx_run_opt %output %stdx_run_args` && b=`clang %n.c && ./a.out` && test $a = $b && echo $? | compare %f
// ASSERT: scan-not 1

from std import os.*
from ffi import c.*

foreign func printf(fmt: CString, ...): Int32

func main(){
    var arr: CString = CString(" ")
    var a:CPointer<UInt8> =  arr.getChars()
    var cp : CPointer<UInt32> = CPointer<UInt32>(a)
    var getg = getgroups(0,cp)
    var s:String = " "

    for ( i in 0..getg){
      s = s + "\0"
    }

    var  arr2: CString = CString(s)
    var  a2:CPointer<UInt8> =  arr2.getChars()
    var  cp2 : CPointer<UInt32> = CPointer<UInt32>(a2)
    var  _ = getgroups(getg,cp2)
    var local:UInt32 = 0

    for ( temp in 0..getg){
        unsafe { local = cp2.read(Int64(temp)) }
        unsafe { printf(CString("%d:%d \n"), temp, local) }
    }

    return 0
}
