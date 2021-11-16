// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*


func main(): Int64{

    
    var src1_path = "/tmp/test1.txt"
    
    var src1: FileInfo = FileInfo(src1_path)
    if (!src1.Create())
    {
        return 1
    }

    src1.GetParentDirectory(true)

    if (!src1.Delete())
    {
        return 1
    }
    
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace