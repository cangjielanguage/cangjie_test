// DEPENDENCE: define3.cj
// EXEC: %compiler %cmp_opt -c define3.cj -o define.%middle
// EXEC: %compiler %cmp_opt define.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan define3.cj 4

import test.*

func main(){
    print("${x} ${y}\n")
    return 0
}