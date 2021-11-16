// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex is not a member of class

from os import os.*
from io import io.*



func main(): Int64{

    var src1_path = "/tmp/test.txt"

    
    var src1: FileInfo = FileInfo(src1_path) 
    if (!src1.Create())
    {
        return 1
    }
    
    src1.GetName(5)
 
      if (!src1.Delete())
    {
        return 1
    }


    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace