// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex argument is mismatched with parameter type 'Record-String'

from os import os.*
from io import io.*

func main(): Int64{

    if (Directory.exist(true)) {
        return 1
    }

    return 0
}