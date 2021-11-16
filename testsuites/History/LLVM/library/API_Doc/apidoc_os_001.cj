// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Linux version
// ASSERT: scan result
// ASSERT: scan logname
// ASSERT: scan-not Exception 

from os import os.*
from ffi import c.*
foreign func printf(fmt: CString, ...): Int32
func main():Int64{
    /* 系统名称相关 */
    var result = getos()
    unsafe { printf(CString("%s"),result) }
    var result2 = gethostname()
    unsafe { printf(CString("result ==> %s\n"),result2) }
    var logname:CString = getlogin()
    unsafe { printf(CString("logname ==>%s\n"),logname) }
    var hostname = gethostname()
    /* 程序运行路径相关函数 */
    var chagePath = CString("/")
    var result4 = chdir(chagePath)
    print("result ==> ${result4}\n")
    var path2:CString = getcwd()
    unsafe { printf(CString("%s\n"),path2) }
    /* 系统id相关函数getpgid */
     var arr: CString = CString(" ")
        var a:CPointer<UInt8> =  arr.getChars()
        var cp : CPointer<UInt32> = CPointer<UInt32>(a)
        var getg = getgroups(0,cp)
        var s:String = " "
        for ( i in 0..getg){
          s = s + "\0"
        }
        print(s.trim()+"\n")
        print("${getg}\n")
        var  arr2: CString = CString(s)
        var a2:CPointer<UInt8> =  arr.getChars()
        var  cp2 : CPointer<UInt32> = CPointer<UInt32>(a2)
        var  getg2 = getgroups(getg,cp)
        var local:UInt32 = 0
        for ( temp in 0..getg){
            unsafe { local = cp.read(Int64(temp)) }
            unsafe {   printf(CString("getgroups ==>%d\n"), local) }
        }
    return 0
}
