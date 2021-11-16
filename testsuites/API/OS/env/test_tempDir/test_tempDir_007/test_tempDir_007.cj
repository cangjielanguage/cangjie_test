// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: unset TMPDIR && export TMP=test_tmp && export TEMP=test_temp && export TEMPDIR=test_tempdir && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan pass

from std import os.*
from std import io.*

func main():Int64{
    var result:DirectoryInfo = tempDir()
    var str:String = result.getPath()

    if (str == "test_tmp"){
        print("pass")
    }

    return 0
}
