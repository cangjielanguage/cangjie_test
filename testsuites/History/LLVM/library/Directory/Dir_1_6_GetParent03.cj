// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*

func main(): Int64{

    Directory.getParentDirectory()

    return 0
}