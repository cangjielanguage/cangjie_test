// DEPENDENCE: define2.cj
// EXEC: %compiler %cmp_opt -c define2.cj -o define.%middle
// EXEC: %compiler %cmp_opt define.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fileline_20002.cj 10

import test.*

func main(){
    print("${foo()} ${bar()}\n")
    return 0
}