// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*

func main(): Int64{

    //当前路径
    var src1_path = 5
    var des1_path = "./test2.txt"

    var src2_path = "./test3.txt"
    var des2_path = 5
    
    var src3_path = "./test5.txt"
    var des3_path = "./test6.txt"
    
    File.Create(src2_path)
    File.Create(src3_path)
    
    File.Move(src1_path,des1_path,true)
    File.Move(src2_path,des2_path,true)
    File.Move(src3_path,des3_path,5)


    if (!File.Delete(des2_path))
    {
        return 1
    }
    if (!File.Delete(des3_path))
    {
    return 1
    }
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace