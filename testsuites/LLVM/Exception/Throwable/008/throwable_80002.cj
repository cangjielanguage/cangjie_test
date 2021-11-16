// DEPENDENCE: use_80002.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80002.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has already occurred
// ASSERT: scan init

package define

class A <: Exception{}

external var a = if (true){throw A();1} else{1}