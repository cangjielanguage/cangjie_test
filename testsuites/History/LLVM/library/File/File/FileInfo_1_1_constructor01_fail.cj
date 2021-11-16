// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching constructor for call

from os import os.*
from io import io.*

func main(): Int64{

    var fi1: FileInfo = FileInfo(5)


    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
