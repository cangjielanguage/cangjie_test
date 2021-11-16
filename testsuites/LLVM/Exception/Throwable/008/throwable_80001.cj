// DEPENDENCE: use_80001.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80001.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan An exception has already occurred
// ASSERT: scan throwable_80001.cj:11

package define

class A <: Exception{}

var a = if (true){throw A();1} else{1}