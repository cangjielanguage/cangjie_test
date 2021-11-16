// DEPENDENCE: getpath.sh path.txt
// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: bash getpath.sh && %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Exception

from std import os.*
from ffi import c.*

func readtxt():CString {
    var arr: Array<Char> = Array<Char>(100, {i => '\0'})
    var str: String = String(arr)

    var buf = CString(str)
    var fd = `open`(CString("path.txt"), O_RDONLY)
    var readNum = read(fd, buf.getChars(), UIntNative(1024))
    close(fd)

    return buf
}


func main(){
    var path: CString = readtxt()
    path = path.subCString(0, (UInt64(path.size())-1))

    var fd = `open`(path, O_RDONLY)
    var result = isatty(fd)

    close(fd)

    return 0
}
