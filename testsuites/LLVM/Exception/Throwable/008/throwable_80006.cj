// DEPENDENCE: use_80006.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80006.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan b!success



package define

external var a = if (true){throw Throwable()} else {1}
