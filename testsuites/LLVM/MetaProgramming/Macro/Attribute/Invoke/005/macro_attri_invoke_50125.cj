// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: regex-auto illegal attribute tokens in macro call, which is '@'

import macro test.*

func main(){
    var a  : Int64 = @M[@{0}[0]](0)
    var b  : Int64 = @M[@{0}](0)[0]
    var c  : Int64 = @{@M[0](0)}[0]
    var d  : Int64 = @{0}[@M[0](0)]
    return a + b + c + d
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace