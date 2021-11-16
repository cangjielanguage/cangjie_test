// DEPENDENCE: use_80007.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80007.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan b!success



package define

var a = if (true){throw Throwable()} else {1}
