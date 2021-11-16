// DEPENDENCE: use_80004.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80004.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has already occurred

package define

external var a = if (true){throw Throwable()} else {1}
