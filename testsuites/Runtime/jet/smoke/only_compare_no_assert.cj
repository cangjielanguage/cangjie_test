// If you compare this file, but no assert flag(ASSERT, EXPECTED) found, compare script will return 1.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-1: %run %run_opt %output %run_args | compare %f

func main(){0}
