// DEPENDENCE: use_80003.cj
// EXEC: %compiler %cmp_opt %f -c -o define.%middle
// EXEC: %compiler %cmp_opt use_80003.cj define.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan b!a in pkg B 1
// ASSERT: scan success


package define

var a = 1

external func test(){
return a
}