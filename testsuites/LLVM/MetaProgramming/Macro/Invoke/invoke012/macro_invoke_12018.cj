// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan illegal attribute tokens in macro call, which is '@'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import macro define.*

func main(){
    @C[@A var x = 1](0)
}