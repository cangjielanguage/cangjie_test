// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*

func main(): Int64{

    //当前路径
    var src1_path = "./test1.txt"
       var des1_path = "./test2.txt"
    var des2_path = "./test2.txt"
    
    File.Create(src1_path)
    
    File.Move(src1_path,des1_path,des2_path)

    if (!File.Delete(src1_path))
    {
        return 1
    }
    
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace