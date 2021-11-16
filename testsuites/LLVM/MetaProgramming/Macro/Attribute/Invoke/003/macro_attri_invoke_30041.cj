// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*

func main(){
    return @M[@M(1,1)](@M(1,1))  // EXPECTED: regex-auto illegal attribute tokens in macro call, which is '@'
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace