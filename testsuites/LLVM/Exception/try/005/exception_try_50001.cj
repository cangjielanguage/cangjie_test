// DEPENDENCE: use_50001.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_50001.cj define.%middle -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan use_50001.cj:4
// ASSERT: scan exception_try_50001.cj:12
package define

class A <: Exception{}

external func test(){
    try {throw A()} finally{}
    return 0
}