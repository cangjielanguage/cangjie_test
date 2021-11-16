// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt -c define.cj -o define.%middle
// EXEC: %compiler %cmp_opt define.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan define.cj 4

import test.*

func main(){
    print("${foo()} ${bar()}\n")
    return 0
}