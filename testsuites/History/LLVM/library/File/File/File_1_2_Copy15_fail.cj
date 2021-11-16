// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*

func main(): Int64{


    var src1_path = 5
    var des1_path = "/tmp/test1.txt"
    
    var src2_path = "/tmp/test1.txt"
    var des2_path = 5
    
    var src3_path = "/tmp/test1.txt"
    var des3_path = "/tmp/test1.txt"

    File.Copy(src1_path,des1_path,true)
    
    File.Copy(src2_path,des2_path,true)
    
    File.Copy(src3_path,des3_path,5)
    

    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace