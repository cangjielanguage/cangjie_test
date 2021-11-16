// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*

func main(): Int64{


    var src1_path = "/tmp/test1.txt"
    var des1_path = "/tmp/test2.txt"

    File.Create(src1_path)

    File.Copy(des1_path)

    if (!File.Delete(src1_path))
    {
        return 1
    }

    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace