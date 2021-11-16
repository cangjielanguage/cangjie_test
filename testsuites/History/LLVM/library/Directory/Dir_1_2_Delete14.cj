// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

from os import os.*
from io import io.*


func main(): Int64{

    // delete directory which is none
    if (Directory.delete(666)) {
        return 1
    }

    return 0
}