// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

func main(){
    var a  : Array<Int64> = @M[@{0}](0)  // EXPECTED: regex-auto illegal attribute tokens in macro call, which is '@'
    return a[0]
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace