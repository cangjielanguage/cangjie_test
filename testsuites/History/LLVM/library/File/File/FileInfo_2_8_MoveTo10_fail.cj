// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex fail to move

from os import os.*
from io import io.*


func main(): Int64{



    var src1_path = "/tmp/test1.txt"
    var des1_path = "/tmp/z/z/z/z/z/z/z/z/z/z/test2.txt"

    // Round 1
    var src1: FileInfo = FileInfo(src1_path)
    if (!src1.Create())
    {
        return 1
    }
    var des1: FileInfo = src1.MoveTo(des1_path,true)

    if (!src1.Delete())
    {
        return 1
    }

    if (des1.Exist())
    {
        return 1
    }



    return 0

}
