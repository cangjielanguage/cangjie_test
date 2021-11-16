// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching constructor for call

from os import os.*
from io import io.*


func main(): Int64{

    //当前路径
    var src1_path = 5
    var des1_path = "/tmp/test2.txt"

    var src1: FileInfo = FileInfo(src1_path)
    if (!src1.Create())
    {
        return 1
    }
    var des1: FileInfo = src1.CopyTo(des1_path,false)

    if (!src1.Delete())
    {
        return 1
    }
    
    return 0
}




// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
