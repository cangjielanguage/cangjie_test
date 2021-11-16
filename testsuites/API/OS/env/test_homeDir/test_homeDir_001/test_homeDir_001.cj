// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: a=~ && b=`%stdx_run %stdx_run_opt %output %stdx_run_args` && if [ "$a" = "$b" ];then echo "pass";fi | compare %f
// ASSERT: scan pass

from std import os.*
from std import io.*

func main():Int64{
    var result:DirectoryInfo = homeDir()
    var str:String = result.getPath()

    print(str)

    return 0
}
